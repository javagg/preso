import 'dart:convert';
import 'dart:typed_data';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// import 'package:universal_html/html.dart' as html;

class FeedbackController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();
  final selectedImages = <XFile>[].obs;
  final isLoading = false.obs;

  Future<void> pickImages() async {
    final files = await openFiles(acceptedTypeGroups: [
      XTypeGroup(label: 'Images', extensions: ['jpg', 'png', 'jpeg'])
    ]);
    selectedImages.addAll(files);
    }

  void removeImage(int index) {
    selectedImages.removeAt(index);
  }

  Future<void> submitForm() async {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      isLoading.value = true;
      final formData = formKey.currentState!.value;
      
      // 这里添加实际提交逻辑
      // 示例使用延时模拟网络请求
      await Future.delayed(Duration(seconds: 2));
      
      isLoading.value = false;
      Get.snackbar(
        '成功',
        '提交成功！',
        snackPosition: SnackPosition.bottom,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      await Future.delayed(Duration(seconds: 1));
      Get.back();
    }
  }
}

class FeedbackBinding implements Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<FeedbackController>(
        () => FeedbackController(),
      )
    ];
  }
}


class FeedbackView extends GetView<FeedbackController> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('意见反馈'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: controller.formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'content',
                decoration: InputDecoration(
                  labelText: '意见内容',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入意见内容';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Obx(() => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton.icon(
                    icon: Icon(Icons.photo_library),
                    label: Text('选择图片'),
                    onPressed: () => controller.pickImages(),
                  ),
                  if (controller.selectedImages.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        '已选择${controller.selectedImages.length}张图片',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: controller.selectedImages.length,
                    itemBuilder: (context, index) {
                      final file = controller.selectedImages[index];
                      return Stack(
                        children: [
                          FutureBuilder<Uint8List>(
                            future: file.readAsBytes(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Image.memory(
                                  snapshot.data!,
                                  fit: BoxFit.cover,
                                );
                              }
                              return Center(child: CircularProgressIndicator());
                            },
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: IconButton(
                              icon: Icon(Icons.close, color: Colors.red),
                              onPressed: () => controller.removeImage(index),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              )),
              SizedBox(height: 20),
              Obx(() => ElevatedButton(
                onPressed: controller.isLoading.value
                    ? null
                    : () => controller.submitForm(),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
                child: controller.isLoading.value
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text('提交意见'),
              )),
            ],
          ),
        ),
      ),
    );
  }
 }