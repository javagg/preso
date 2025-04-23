import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:preso_common/preso_common.dart';
import '../../../serverpod_client.dart' as pod;

class StoreFormController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();

  var name = ''.obs;
  var description = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  Future<void> fetch() async {
     var id = int.parse(Get.parameters['id']!);
     var store = (await pod.client.store.get(id))!;
      name.value = store.name;
      description.value = store.description;
  }
 
}

class StoreFormBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [Bind.lazyPut<StoreFormController>(() => StoreFormController())];
  }
}

class StoreFormView extends GetView<StoreFormController> {
  const StoreFormView({super.key});

  @override
  Widget build(BuildContext context) {
    var id = Get.parameters['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text("$id"),
        leading: BackButton(onPressed: () => Get.back()),
      ),
      body: FormBuilder(
        key: controller.formKey,
        child: Column(
          children: [
            FormBuilderTextField(
              name: 'name',
              decoration: InputDecoration(
                labelText: "tenant.name".tr,
                hintText: '输入3-20个字符',
              ),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: '不能为空'),
                FormBuilderValidators.minLength(3, errorText: '至少3个字符'),
                FormBuilderValidators.maxLength(20, errorText: '最多20个字符'),
                FormBuilderValidators.match(
                  r'^[a-zA-Z0-9_]+$',
                  errorText: '只能包含字母、数字和下划线',
                ),
              ]),
            ),
            const SizedBox(height: 16),
            FormBuilderTextField(
              name: 'description',
              decoration: InputDecoration(
                labelText: "tenant.description".tr,
                // hintText: '输入有效的邮箱地址',
              ),
              keyboardType: TextInputType.emailAddress,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: '不能为空'),
                // FormBuilderValidators.email(errorText: '请输入有效的邮箱'),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
