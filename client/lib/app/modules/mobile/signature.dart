import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class SignatureController extends GetxController {
  GlobalKey<SfSignaturePadState> signaturePadKey = GlobalKey();

  Uint8List? signatureData;

  Future<void> saveSignature() async {
    final image = await signaturePadKey.currentState!.toImage(pixelRatio: 3.0);
    final byteData = await image.toByteData(format: ImageByteFormat.png);
    signatureData = byteData?.buffer.asUint8List();
    Get.back(result: signatureData);
  }

  void saveAndExit(BuildContext context) async {
    await saveSignature();
    Get.back(result: signatureData);
  }
}

class SignatureView extends StatelessWidget {
  const SignatureView({super.key});

  @override
  Widget build(BuildContext context) {
    final SignatureController controller = Get.put(SignatureController());

    return Scaffold(
      appBar: AppBar(title: Text('电子签名')),
      body: Column(
        children: [
          Expanded(
            child: SfSignaturePad(
              key: controller.signaturePadKey,
              minimumStrokeWidth: 2,
              maximumStrokeWidth: 8,
              strokeColor: Colors.blue,
              backgroundColor: Colors.grey[200],
              // onDrawEnd: () {
              //   controller.saveSignature();
              // },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: Text('清除'),
                onPressed: () =>
                    controller.signaturePadKey.currentState!.clear(),
              ),
              ElevatedButton(
                child: Text('保存'),
                onPressed: () => controller.saveAndExit(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
