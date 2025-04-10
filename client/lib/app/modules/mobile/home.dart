import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {}

class HomeBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<HomeController>(
        () => HomeController(),
      )
    ];
  }
}

class DashboardView extends GetView<HomeController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("home");
  }
}
