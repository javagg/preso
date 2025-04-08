import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrainerBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<TrainerViewController>(
        () => TrainerViewController(),
      )
    ];
  }
}

class TrainerViewController extends GetxController {}

class TrainerView extends GetView<TrainerViewController> {
  const TrainerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("TrainerView");
  }
}
