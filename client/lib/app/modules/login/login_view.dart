import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preso_client/serverpod_client.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:serverpod_auth_wechat_flutter/serverpod_auth_wechat_flutter.dart';

import '../../../services/auth_service.dart';
import '../../routes/app_routes.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(
              () {
                final isLoggedIn = AuthService.to.isLoggedInValue;
                return Text(
                  'You are currently:'
                  ' ${isLoggedIn ? "Logged In" : "Not Logged In"}'
                  "\nIt's impossible to enter this "
                  "route when you are logged in!",
                );
              },
            ),
            MaterialButton(
              child: const Text(
                'Do LOGIN !!',
                style: TextStyle(color: Colors.blue, fontSize: 20),
              ),
              onPressed: () {
                AuthService.to.login();
                final thenTo = context.params['then'];
                Get.offNamed(thenTo ?? Routes.home);
              },
            ),
            Row(children: [
              SignInWithEmailButton(
                caller: client.modules.auth,
              ),
              SignInWithWechatButton(
                caller: client.modules.auth,
                clientId: "_googleClientId",
                serverClientId: "_googleServerClientId",
                redirectUri: Uri.parse('http://localhost:8082/wechatsignin'),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
