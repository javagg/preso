import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaleBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<SaleController>(
        () => SaleController(),
      )
    ];
  }
}

class SaleController extends GetxController {}

class SaleView extends GetView<SaleController> {
  const SaleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("sales");
  }
}
