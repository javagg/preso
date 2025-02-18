import 'package:flutter/foundation.dart';
import './Wechat_sign_in_web_service.dart';
import './sign_in_with_Wechat_platform.dart';

/// Attempts to signin with Wechat on the web and returns the auth tokens.
SignInWithWechatPlatform signInWithWechatPlatform = ({
  clientId,
  serverClientId,
  required scopes,
  required redirectUri,
}) async {
  assert(serverClientId != null);

  var WechatSignIn = WechatSignInWebService(
    scopes: scopes,
    // The clientId is the serverClientId on the web.
    clientId: serverClientId!,
    redirectUri: redirectUri.toString(),
  );

  var serverAuthCode = await WechatSignIn.signIn();
  if (serverAuthCode == null) {
    if (kDebugMode) {
      print(
        'serverpod_auth_Wechat: WechatSignIn.signIn() returned null. Aborting.',
      );
    }
    throw Exception('Signin was aborted.');
  }

  return ClientAuthTokens(serverAuthCode: serverAuthCode);
};
