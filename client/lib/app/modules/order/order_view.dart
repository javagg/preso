import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'order_controller.dart';
import 'package:data_table_2/data_table_2.dart';


class OrderView extends GetView<OrderViewController> {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX DataTable2 示例'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.isLoading.value ? null : controller.refreshData,
            tooltip: '刷新数据',
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.value.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(controller.errorMessage.value, 
                    style: const TextStyle(color: Colors.red)),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: controller.refreshData,
                  child: const Text('重试'),
                ),
              ],
            ),
          );
        }

        if (controller.employees.isEmpty) {
          return const Center(child: Text('没有数据'));
        }

        return _buildDataTable(controller);
      }),
    );
  }

  Widget _buildDataTable(OrderViewController controller) {
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
                sortColumnIndex: controller.sortColumnIndex.value,
                sortAscending: controller.sortAscending.value,
                columns: [
                  DataColumn2(
                    label: const Text('ID'),
                    size: ColumnSize.S,
                    onSort: controller.sort,
                  ),
                  DataColumn2(
                    label: const Text('姓名'),
                    size: ColumnSize.L,
                    onSort: controller.sort,
                  ),
                  DataColumn2(
                    label: const Text('年龄'),
                    size: ColumnSize.S,
                    numeric: true,
                    onSort: controller.sort,
                  ),
                  DataColumn2(
                    label: const Text('部门'),
                    size: ColumnSize.M,
                    onSort: controller.sort,
                  ),
                  DataColumn2(
                    label: const Text('薪资'),
                    size: ColumnSize.M,
                    numeric: true,
                    onSort: controller.sort,
                  ),
                ],
                rows: controller.paginatedData
                    .map((employee) => DataRow2(
                          selected: employee.id % 2 == 0,
                          onSelectChanged: (selected) {
                            if (selected != null) {
                              Get.snackbar(
                                '选中',
                                '选中了 ${employee.name}',
                                snackPosition: SnackPosition.bottom,
                              );
                            }
                          },
                          cells: [
                            DataCell(Text(employee.id.toString())),
                            DataCell(Text(employee.name)),
                            DataCell(Text(employee.age.toString())),
                            DataCell(Text(employee.department)),
                            DataCell(Text('\$${employee.salary.toStringAsFixed(2)}')),
                          ],
                        ))
                    .toList(),
              ),
            ),
          ),
          _buildPaginationControls(controller),
        ],
      ),
    );
  }

  Widget _buildPaginationControls(OrderViewController controller) {
    return Obx(() {
      final startItem = controller.currentPage.value * controller.rowsPerPage.value + 1;
      final endItem = (controller.currentPage.value + 1) * controller.rowsPerPage.value;
      final totalItems = controller.employees.length;
      
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text('每页行数:'),
          DropdownButton<int>(
            value: controller.rowsPerPage.value,
            items: [3, 5, 10].map((value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text('$value'),
              );
            }).toList(),
            onChanged: controller.changeRowsPerPage,
          ),
          const SizedBox(width: 16),
          Text('$startItem-${endItem > totalItems ? totalItems : endItem} of $totalItems'),
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: controller.currentPage.value > 0
                ? controller.previousPage
                : null,
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: (controller.currentPage.value + 1) * controller.rowsPerPage.value < 
                    controller.employees.length
                ? controller.nextPage
                : null,
          ),
        ],
      );
    });
  }
}