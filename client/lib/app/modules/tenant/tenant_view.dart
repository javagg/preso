import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:trina_grid/trina_grid.dart';
import '../../../serverpod_client.dart' as pod;
import 'package:preso_common/preso_common.dart';

class _FormController extends GetxController {
  final formKey = GlobalKey<FormBuilderState>();

  final submitting = false.obs;

  Future<bool> submitForm() async {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      submitting.value = true;
      try {
        final formData = formKey.currentState!.value;
        print(formData);
        await pod.client.tenant.create(
            Tenant(name: formData['name'], description: formData['description'])
            // pod.TenantCreate(
            //   name: formData['name'],
            //   description: formData['description'],
            // ),
            );
        return true;
        // Get.snackbar(
        //   '提交成功',
        //   '表单数据已成功提交',
        //   snackPosition: SnackPosition.bottom,
        // );
      } catch (e) {
        Get.snackbar(
          '提交失败',
          '错误: ${e.toString()}',
          snackPosition: SnackPosition.bottom,
        );
        return false;
      } finally {
        submitting.value = false;
      }
    } else {
      Get.snackbar(
        '表单验证失败',
        '请检查表单中的错误',
        snackPosition: SnackPosition.bottom,
      );
      return false;
    }
  }

  void resetForm() {
    formKey.currentState?.reset();
  }
}

class TenantDialog extends GetView<_FormController> {
  final bool update;
  TenantDialog({super.key, this.update = false});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(_FormController());
    return AlertDialog(
      title: Text(update ? "common.edit".tr : "common.create".tr),
      content: SingleChildScrollView(
        child: FormBuilder(
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
              // Obx(
              //   () => TextButton(
              //     onPressed: controller.submitting.value
              //         ? null
              //         : controller.submitForm,
              //     child: controller.submitting.value
              //         ? const CircularProgressIndicator()
              //         : Text("common.submit".tr),
              //   ),
              // ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          child: Text("common.cancel".tr),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        Obx(
          () => TextButton(
            onPressed: controller.submitting.value
                ? null
                : () {
                    // Navigator.of(context).pop();
                    controller.submitForm();
                  },
            child: controller.submitting.value
                ? const CircularProgressIndicator()
                : Text("common.submit".tr),
          ),
        ),
      ],
    );
  }
}

class TenantBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<TenantController>(
        () => TenantController(),
      )
    ];
  }
}

class TenantController extends GetxController {
  final columns = <TrinaColumn>[
    TrinaColumn(
      title: 'Id',
      field: 'id',
      enableEditingMode: false,
      type: TrinaColumnType.number(),
    ),
    TrinaColumn(
      title: 'Name',
      field: 'name',
      type: TrinaColumnType.text(),
    ),
    TrinaColumn(
      title: 'Desc',
      field: 'description',
      type: TrinaColumnType.text(),
    ),
    TrinaColumn(
      title: 'Op',
      field: 'operation',
      type: TrinaColumnType.text(),
    ),
  ];

  final List<TrinaColumnGroup> columnGroups = [
    TrinaColumnGroup(title: 'Id', fields: ['id']),
    TrinaColumnGroup(title: 'Tenant information', fields: ['name', 'age']),
    // TrinaColumnGroup(
    //   title: 'Status',
    //   children: [
    //     TrinaColumnGroup(title: 'A', fields: ['role'], expandedColumn: true),
    //     TrinaColumnGroup(
    //         title: 'Etc.', fields: ['joined', 'working_time', 'role2']),
    //   ],
    // ),
  ];

  /// [TrinaGridStateManager] has many methods and properties to dynamically manipulate the grid.
  /// You can manipulate the grid dynamically at runtime by passing this through the [onLoaded] callback.
  late final TrinaGridStateManager stateManager;

  var tenants = <Tenant>[].obs;
  var loading = false.obs;
  var error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  Future<void> fetch() async {
    // stateManager.setShowLoading(true);
    try {
      loading.value = true;
      error.value = '';
      await Future.delayed(Duration(seconds: 1));
      tenants.value = await pod.client.tenant.all(10, 0);
    } catch (e) {
      error.value = 'Error: ${e.toString()}';
      // Get.snackbar(
      //   'Error',
      //   error.value,
      //   snackPosition: SnackPosition.bottom,
      //   backgroundColor: Colors.red,
      //   colorText: Colors.white,
      // );
    } finally {
      loading.value = false;
      // stateManager.setShowLoading(false);
    }
  }
}

class TenantView extends GetView<TenantController> {
  const TenantView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await Get.dialog(
                  TenantDialog(update: true),
                  barrierDismissible: false,
                );
              },
              icon: Icon(Icons.add_circle_outline)),
          IconButton(
            onPressed: () async {
              await controller.fetch();
            },
            icon: Icon(Icons.import_export_outlined),
          )
        ],
      ),
      body: Obx(
        () {
          if (controller.loading.value && controller.tenants.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }

          if (controller.error.value.isNotEmpty && controller.tenants.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(controller.error.value),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: controller.refresh,
                    child: Text('Retry'),
                  ),
                ],
              ),
            );
          }

          return TrinaGrid(
            columns: controller.columns,
            onLoaded: (event) async {
              controller.stateManager = event.stateManager;
              // controller.stateManager.setShowColumnFilter(true);
              // controller.stateManager.setShowLoading(true);
              // await controller.fetch();
              // controller.stateManager.setShowLoading(false);
            },
            onChanged: (event) {},
            rows: controller.tenants.map((r) {
              return TrinaRow(
                cells: {
                  'id': TrinaCell(value: r.id),
                  'name': TrinaCell(value: r.name),
                  'description': TrinaCell(value: r.description),
                  'operation': TrinaCell(
                    renderer: (rendererContext) {
                      return Row(
                        children: [
                          IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                          IconButton(
                              onPressed: () async {
                                if (await confirm(
                                  context,
                                  title: Text('common.delete'.tr),
                                  content: Text('common.confirm_delete'.tr),
                                )) {
                                  await pod.client.tenant.delete(r);
                                }
                              },
                              icon: Icon(Icons.delete)),
                        ],
                      );
                    },
                  )
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
