import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../face_reg.dart';

class FaceBinding implements Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<FaceController>(
        () => FaceController(),
      )
    ];
  }
}

class FaceController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }
}

class FaceView extends GetView<FaceController> {
  const FaceView({super.key});

  @override
  Widget build(BuildContext context) {
    return FaceRecognitionPage();
  }
}