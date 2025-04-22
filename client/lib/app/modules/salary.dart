import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalaryBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<SalaryController>(
        () => SalaryController(),
      )
    ];
  }
}

class SalaryController extends GetxController {}

class SalaryView extends GetView<SalaryController> {
  const SalaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Salary"),
      ),
      body: Center(
        child: Text("Salary"),
      ),
    );
  }
}
