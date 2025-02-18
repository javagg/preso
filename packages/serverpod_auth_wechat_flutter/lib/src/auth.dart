import 'package:flutter/foundation.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import './wechat/sign_in_with_wechat.dart';

Future<UserInfo?> signInWithWechat(
  Caller caller, {
  // bool debug = false, //TODO: Remove this parameter on next breaking change.
  String? clientId,
  String? serverClientId,
  List<String> additionalScopes = const [],
  required Uri redirectUri,
  void Function(Object error, StackTrace stackTrace)? onError,
}) async {
  var scopes = [
    'email',
    // 'https://www.googleapis.com/auth/userinfo.profile',
  ];
  scopes.addAll(additionalScopes);

  if (kDebugMode) print('serverpod_auth_wechat: WechatSignIn');

  try {
    var tokens = await signInWithWechatPlatform(
      scopes: scopes,
      clientId: clientId,
      serverClientId: serverClientId,
      redirectUri: redirectUri,
    );

    // Authenticate with the Serverpod server.
    AuthenticationResponse serverResponse;
    if (tokens.serverAuthCode != null) {
      // Prefer to authenticate with serverAuthCode
      serverResponse = await caller.wechat.authenticateWithServerAuthCode(
        tokens.serverAuthCode!,
        redirectUri.toString(),
      );
    } else {
      // Fall back on idToken
      serverResponse =
          await caller.wechat.authenticateWithIdToken(tokens.idToken!);
    }

    if (!serverResponse.success) {
      if (kDebugMode) {
        print(
          'serverpod_auth_wechat: Failed to authenticate with Serverpod backend: '
          '${serverResponse.failReason ?? 'reason unknown'}. Aborting.',
        );
      }
      return null;
    }

    // Store the user info in the session manager.
    var sessionManager = await SessionManager.instance;

    await sessionManager.registerSignedInUser(
      serverResponse.userInfo!,
      serverResponse.keyId!,
      serverResponse.key!,
    );

    if (kDebugMode) {
      print(
        'serverpod_auth_wechat: Authentication was successful. Saved credentials to SessionManager',
      );
    }

    return serverResponse.userInfo;
  } catch (e, stackTrace) {
    if (kDebugMode) print('serverpod_auth_wechat: $e');
    if (kDebugMode) print('$stackTrace');
    onError?.call(e, stackTrace);
    return null;
  }
}
