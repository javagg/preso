import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<LogController>(
        () => LogController(),
      )
    ];
  }
}

class LogController extends GetxController {}

class LogView extends GetView<LogController> {
  const LogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("log");
  }
}
