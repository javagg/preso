import 'package:flutter/material.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';
// as auth_client;
// import 'package:serverpod_auth_client_wechat/serverpod_auth_client_wechat.dart';
import 'auth.dart';

class SignInWithWechatButton extends StatefulWidget {
  final Caller caller;

  final VoidCallback? onSignedIn;

  /// Called if sign in is unsuccessful.
  final VoidCallback? onFailure;

  final String? clientId;

  final String? serverClientId;

  final Uri redirectUri;

  const SignInWithWechatButton({
    required this.caller,
    this.clientId,
    this.serverClientId,
    this.onSignedIn,
    this.onFailure,
    // this.style,
    // this.label,
    required this.redirectUri,
    super.key,
  });

  @override
  SignInWithWechatButtonState createState() => SignInWithWechatButtonState();
}

class SignInWithWechatButtonState extends State<SignInWithWechatButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      // style: widget.style ??
      //     ElevatedButton.styleFrom(
      //       backgroundColor: Colors.white,
      //       foregroundColor: Colors.grey[700],
      //       // alignment: widget.alignment,
      //       padding: const EdgeInsets.symmetric(horizontal: 16),
      //     ),
      onPressed: () {
        // Open a dialog with just the progress indicator that isn't
        // dismissible.
        showLoadingBarrier(context: context);
        var navigator = Navigator.of(context, rootNavigator: true);

        // Attempt to sign in the user.
        signInWithWechat(
          widget.caller,
          // debug: widget.debug,
          clientId: widget.clientId,
          serverClientId: widget.serverClientId,
          // additionalScopes: widget.additionalScopes,
          redirectUri: widget.redirectUri,
        ).then((UserInfo? userInfo) {
          // Notify the parent.
          if (userInfo != null) {
            widget.onSignedIn?.call();
          } else {
            widget.onFailure?.call();
          }
        }).onError((error, stackTrace) {
          widget.onFailure?.call();
        }).whenComplete(() => navigator.pop());
      },
      label: Text(/*widget.label ?? */ 'Sign in with Wechat'),
      icon: Image.asset(
        'assets/wechat-icon.png',
        package: 'serverpod_auth_wechat_flutter',
        width: 24,
        height: 24,
      ),
    );
  }
}
