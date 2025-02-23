import 'package:get/get.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  /// Mocks a login process
  final loggedIn = false.obs;
  bool get isLoggedInValue => loggedIn.value;

  void login() {
    loggedIn.value = true;
  }

  void logout() {
    loggedIn.value = false;
  }
}
