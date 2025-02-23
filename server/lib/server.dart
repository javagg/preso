import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:mailer/smtp_server/qq.dart';
import 'package:serverpod/serverpod.dart';

import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

import 'package:preso_server/src/web/routes/root.dart';

import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';

import 'dart:io';
// This is the starting point of your Serverpod server. In most cases, you will
// only need to make additions to this file if you add future calls,  are
// configuring Relic (Serverpod's web-server), or need custom setup work.

class RouteWechatSignIn extends WidgetRoute {
  @override
  Future<AbstractWidget> build(Session session, HttpRequest request) async {
    return WechatSignInRedirectPageWidget();
  }
}

class WechatSignInRedirectPageWidget extends AbstractWidget {
  @override
  String toString() {
    return '''<html>
<head>
  <script>
    function findParam(name) {
      let result = null;
      location.search
        .substr(1)
        .split("&")
        .forEach(function (item) {
          const tmp = item.split("=");
          if (tmp[0] === name) result = decodeURIComponent(tmp[1]);
        });
      return result;
    }

    function returnToWebClient() {
      const code = findParam('code');
      window.opener.postMessage(code, '*');
      window.close();
    }

    returnToWebClient();
  </script>
</head>

<body>
</body>

</html>''';
  }
}

void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    authenticationHandler: auth.authenticationHandler,
  );

  // If you are using any future calls, they need to be registered here.
  // pod.registerFutureCall(ExampleFutureCall(), 'exampleFutureCall');

  // Setup a default page at the web root.
  pod.webServer.addRoute(RouteRoot(), '/');
  pod.webServer.addRoute(RouteRoot(), '/index.html');

  // Setup a redirect route for Google sign in. Responsible for sending back
  // the serverAuthCode to the client and closing the signin window, after a
  // successful sign in.
  pod.webServer.addRoute(auth.RouteGoogleSignIn(), '/googlesignin');

  pod.webServer.addRoute(RouteWechatSignIn(), '/wechatsignin');

  // Serve all files in the /static directory.
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'static', basePath: '/'),
    '/*',
  );

  // Configuration for sign in with email.
  // You have to setup an App Password with gmail for this to work
  // see https://support.google.com/accounts/answer/185833?hl=en for how to do that.
  // Then add the email and password to the config/passwords.yaml file.
  // This is a test example, do not use this type of integration in production
  // as that may lead to you getting blocked for spam and other issues.
  // Instead use a real email service provider, such as SendGrid, Mailjet or others.

  // auth.AuthConfig.set(auth.AuthConfig(
  //   sendValidationEmail: (session, email, validationCode) async {
  //     // Retrieve the credentials
  //     final gmailEmail = session.serverpod.getPassword('gmailEmail')!;
  //     final gmailPassword = session.serverpod.getPassword('gmailPassword')!;

  //     // Create a SMTP client for Gmail.
  //     final smtpServer = gmail(gmailEmail, gmailPassword);

  //     // Create an email message with the validation code.
  //     final message = Message()
  //       ..from = Address(gmailEmail)
  //       ..recipients.add(email)
  //       ..subject = 'Verification code for Serverpod'
  //       ..html = 'Your verification code is: $validationCode';

  //     // Send the email message.
  //     try {
  //       await send(message, smtpServer);
  //     } catch (_) {
  //       // Return false if the email could not be sent.
  //       return false;
  //     }

  //     return true;
  //   },
  //   sendPasswordResetEmail: (session, userInfo, validationCode) async {
  //     // Retrieve the credentials
  //     final gmailEmail = session.serverpod.getPassword('gmailEmail')!;
  //     final gmailPassword = session.serverpod.getPassword('gmailPassword')!;

  //     // Create a SMTP client for Gmail.
  //     final smtpServer = gmail(gmailEmail, gmailPassword);

  //     // Create an email message with the password reset link.
  //     final message = Message()
  //       ..from = Address(gmailEmail)
  //       ..recipients.add(userInfo.email!)
  //       ..subject = 'Password reset link for Serverpod'
  //       ..html = 'Here is your password reset code: $validationCode';

  //     // Send the email message.
  //     try {
  //       await send(message, smtpServer);
  //     } catch (_) {
  //       // Return false if the email could not be sent.
  //       return false;
  //     }

  //     return true;
  //   },
  // ));
  auth.AuthConfig.set(auth.AuthConfig(
    sendValidationEmail: (session, email, validationCode) async {
      print('Validation code: $validationCode');

      // final mailUser = session.serverpod.getPassword('mailUser')!;
      // final mailPass = session.serverpod.getPassword('mailPass')!;
      // final smtp = qq(mailUser, mailPass);
      // final message = Message()
      //   ..from = Address(mailUser)
      //   ..recipients.add(email)
      //   ..subject = 'Verification code for Serverpod'
      //   ..html = 'Your verification code is: $validationCode';

      // // Send the email message.
      // try {
      //   await send(message, smtp);
      // } catch (_) {
      //   // Return false if the email could not be sent.
      //   return false;
      // }

      return true;
    },
    sendPasswordResetEmail: (session, userInfo, validationCode) async {
      print('Validation code: $validationCode');
      return true;
    },
  ));
  // Start the server.
  await pod.start();
}
