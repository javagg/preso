import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';

class AdminBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<AdminController>(
        () => AdminController(),
      )
    ];
  }
}
class AdminController extends GetxController {}


class AdminView extends GetView<AdminController> {
  const AdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetRouterOutlet(
        initialRoute: Routes.stores,
        anchorRoute: Routes.admin,
      ),
    );
  }
}
