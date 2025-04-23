import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preso_common/preso_common.dart';
import '../../../serverpod_client.dart' as pod;
import '../../routes/web/app_pages.dart';
import 'store_form.dart';

class StoreController extends GetxController {
  var loading = false.obs;
  var error = ''.obs;

  var page = 0.obs;
  var limit = 10.obs;

  var count = 0.obs;
  var stores = <Store>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  Future<void> fetch() async {
    // stateManager.setShowLoading(true);
    try {
      loading.value = true;
      // error.value = '';
      await Future.delayed(Duration(seconds: 1));
      // count.value = await pod.client.store.();
      stores.value = await pod.client.store.all();
    } catch (e) {
      // error.value = 'Error: ${e.toString()}';
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

  Future<void> refreshData() async {
    page(0);
    await fetch();
  }

  // void previous() {
  //   if (page > 0) {
  //     page(page.value - 1);
  //   }
  // }

  // void next() {
  //   if ((page.value + 1) * limit.value < stores.length) {
  //     page(page.value + 1);
  //   }
  // }
}

class StoreBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<StoreController>(
        () => StoreController(),
      )
    ];
  }
}

class StoreView extends GetView<StoreController> {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                Get.toNamed( Routes.stores + '/add');
                // await Get.dialog(
                //   StoreDialog(update: true),
                //   barrierDismissible: false,
                // );
              },
              icon: Icon(Icons.add_outlined))
        ],
      ),
      body: Obx(() {
        if (controller.loading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.error.value.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(controller.error.value,
                    style: const TextStyle(color: Colors.red)),
                const SizedBox(height: 16),
                // ElevatedButton(
                //   onPressed: controller.refresh,
                //   child: const Text('重试'),
                // ),
              ],
            ),
          );
        }

        if (controller.stores.isEmpty) {
          return const Center(child: Text('没有数据'));
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: controller.refreshData,
                  child: DataTable2(
                    columnSpacing: 12,
                    horizontalMargin: 12,
                    minWidth: 600,
                    // sortColumnIndex: controller.sortColumnIndex.value,
                    // sortAscending: controller.sortAscending.value,
                    columns: [
                      DataColumn2(
                        label: const Text('ID'),
                        size: ColumnSize.S,
                        // onSort: controller.sort,
                      ),
                      DataColumn2(
                        label: const Text('姓名'),
                        size: ColumnSize.L,
                        // onSort: controller.sort,
                      ),
                      DataColumn2(
                        label: const Text('描述'),
                        size: ColumnSize.S,
                        numeric: true,
                        // onSort: controller.sort,
                      ),
                      // DataColumn2(
                      //   label: const Text('部门'),
                      //   size: ColumnSize.M,
                      //   // onSort: controller.sort,
                      // ),
                      // DataColumn2(
                      //   label: const Text('薪资'),
                      //   size: ColumnSize.M,
                      //   numeric: true,
                      //   // onSort: controller.sort,
                      // ),
                      DataColumn2(
                        label: const Text('操作'),
                        size: ColumnSize.M,
                        // numeric: true,
                        // onSort: controller.sort,
                      ),
                    ],
                    rows: controller.stores // pagenated
                        .map((store) => DataRow2(
                              // selected: store.id % 2 == 0,
                              // onSelectChanged: (selected) {
                              //   if (selected != null) {
                              //     Get.snackbar(
                              //       '选中',
                              //       '选中了 ${employee.name}',
                              //       snackPosition: SnackPosition.bottom,
                              //     );
                              //   }
                              // },
                              cells: [
                                DataCell(Text("${store.id!}")),
                                DataCell(Text(store.name)),
                                DataCell(Text(store.description.toString())),
                                // DataCell(Text(employee.department)),
                                // DataCell(Text(
                                //     '\$${employee.salary.toStringAsFixed(2)}')),
                                DataCell(Row(
                                  children: [
                                    IconButton.outlined(
                                      onPressed: () {
                                        Get.toNamed('${Routes.edit_store}/${store.id!}');

                                        // Get.snackbar("edit", "edit");
                                      },
                                      icon: Icon(Icons.edit),
                                    ),
                                    IconButton.outlined(
                                      onPressed: () {
                                        Get.snackbar("delete", "deleted");
                                      },
                                      icon: Icon(Icons.delete),
                                    ),
                                  ],
                                )),
                              ],
                            ))
                        .toList(),
                  ),
                ),
              ),
              // _buildPaginationControls(controller),
            ],
          ),
        );
      }),
    );
  }
}

class StoreDialog extends StatelessWidget {
  final bool update;

  const StoreDialog({this.update = false});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
