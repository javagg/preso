import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClassBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<ClassViewController>(
        () => ClassViewController(),
      )
    ];
  }
}

class ClassViewController extends GetxController {}

class OrderView extends GetView<ClassViewController> {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("class");
  }
}
