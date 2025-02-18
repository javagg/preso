// import 'package:google_sign_in/google_sign_in.dart';
import './sign_in_with_wechat_platform.dart';

/// Attempts to signin with google on mobile platforms and returns the auth tokens.
SignInWithWechatPlatform signInWithWechatPlatform = ({
  clientId,
  serverClientId,
  required scopes,
  required redirectUri,
}) async {
  throw UnimplementedError();
  // var googleSignIn = GoogleSignIn(
  //   scopes: scopes,
  //   clientId: clientId,
  //   serverClientId: serverClientId,
  //   // Required because of bug in googleapis.dart:
  //   // https://github.com/google/googleapis.dart/issues/487
  //   forceCodeForRefreshToken: true,
  // );

  // var result = await googleSignIn.signIn();
  // if (result == null) {
  //   if (kDebugMode) {
  //     print(
  //       'serverpod_auth_wechat: WechatSignIn.signIn() returned null. Aborting.',
  //     );
  //   }
  //   throw Exception('Signin was aborted.');
  // }

  // var serverAuthCode = result.serverAuthCode;
  // String? idToken;
  // if (serverAuthCode == null) {
  //   if (kDebugMode) {
  //     print(
  //       'serverpod_auth_wechat: serverAuthCode is null. Trying auth.idToken.',
  //     );
  //   }
  //   var auth = await result.authentication;
  //   idToken = auth.idToken;
  // }

  // // Authentication with server is complete, we can sign out from Google locally
  // if (kDebugMode) print('serverpod_auth_wechat: Signing out from google');

  // if (serverAuthCode != null || idToken != null) {
  //   await googleSignIn.signOut();

  //   if (kDebugMode) {
  //     try {
  //       await googleSignIn.disconnect();
  //     } catch (e) {
  //       // Print without stacktrace (this seems to fail every time, #735)
  //       print('serverpod_auth_wechat: $e');
  //     }
  //   }
  // }

  // return ClientAuthTokens(idToken: idToken, serverAuthCode: serverAuthCode);
};
