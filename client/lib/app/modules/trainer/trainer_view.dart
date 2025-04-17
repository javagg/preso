import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Employee {
  final int id;
  final String name;
  final int age;
  final String department;
  final double salary;

  Employee({
    required this.id,
    required this.name,
    required this.age,
    required this.department,
    required this.salary,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      department: json['department'],
      salary: json['salary'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'department': department,
      'salary': salary,
    };
  }
}

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

class TrainerViewController extends GetxController {
  var employees = <Employee>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  // 分页相关
  var currentPage = 0.obs;
  var rowsPerPage = 5.obs;

  // 排序相关
  var sortColumnIndex = 0.obs;
  var sortAscending = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchEmployees();
  }

  // 获取员工数据
  Future<void> fetchEmployees() async {
    try {
      isLoading(true);
      errorMessage('');

      // 模拟网络请求延迟
      await Future.delayed(const Duration(seconds: 1));

      // 模拟API响应数据
      final mockData = [
        {
          'id': 1,
          'name': '张三',
          'age': 28,
          'department': '研发部',
          'salary': 15000
        },
        {
          'id': 2,
          'name': '李四',
          'age': 32,
          'department': '市场部',
          'salary': 12000
        },
        {
          'id': 3,
          'name': '王五',
          'age': 25,
          'department': '人事部',
          'salary': 10000
        },
        {
          'id': 4,
          'name': '赵六',
          'age': 40,
          'department': '财务部',
          'salary': 18000
        },
        {
          'id': 5,
          'name': '钱七',
          'age': 35,
          'department': '研发部',
          'salary': 16000
        },
        {
          'id': 6,
          'name': '孙八',
          'age': 29,
          'department': '市场部',
          'salary': 11000
        },
        {
          'id': 7,
          'name': '周九',
          'age': 45,
          'department': '管理层',
          'salary': 25000
        },
        {
          'id': 8,
          'name': '吴十',
          'age': 31,
          'department': '研发部',
          'salary': 17000
        },
      ];

      employees.assignAll(mockData.map((e) => Employee.fromJson(e)).toList());
    } catch (e) {
      errorMessage('数据加载失败: ${e.toString()}');
    } finally {
      isLoading(false);
    }
  }

  // 刷新数据
  Future<void> refreshData() async {
    currentPage(0);
    await fetchEmployees();
  }

  // 排序方法
  void sort<T>(int columnIndex, bool ascending) {
    sortColumnIndex(columnIndex);
    sortAscending(ascending);

    switch (columnIndex) {
      case 0:
        employees.sort(
            (a, b) => ascending ? a.id.compareTo(b.id) : b.id.compareTo(a.id));
        break;
      case 1:
        employees.sort((a, b) =>
            ascending ? a.name.compareTo(b.name) : b.name.compareTo(a.name));
        break;
      case 2:
        employees.sort((a, b) =>
            ascending ? a.age.compareTo(b.age) : b.age.compareTo(a.age));
        break;
      case 3:
        employees.sort((a, b) => ascending
            ? a.department.compareTo(b.department)
            : b.department.compareTo(a.department));
        break;
      case 4:
        employees.sort((a, b) => ascending
            ? a.salary.compareTo(b.salary)
            : b.salary.compareTo(a.salary));
        break;
    }
  }

  // 获取当前页的数据
  List<Employee> get paginatedData {
    final start = currentPage.value * rowsPerPage.value;
    final end = (currentPage.value + 1) * rowsPerPage.value;
    return employees.length > end
        ? employees.sublist(start, end)
        : employees.sublist(start);
  }

  // 改变每页行数
  void changeRowsPerPage(int? value) {
    if (value != null) {
      rowsPerPage(value);
      currentPage(0);
    }
  }

  // 上一页
  void previousPage() {
    if (currentPage > 0) {
      currentPage(currentPage.value - 1);
    }
  }

  // 下一页
  void nextPage() {
    if ((currentPage.value + 1) * rowsPerPage.value < employees.length) {
      currentPage(currentPage.value + 1);
    }
  }
}

class FormController extends GetxController {
  // 表单key
  final formKey = GlobalKey<FormBuilderState>();

  // 表单提交状态
  final isLoading = false.obs;

  // 提交表单
  Future<void> submitForm() async {
    if (formKey.currentState?.saveAndValidate() ?? false) {
      isLoading.value = true;

      // 模拟网络请求
      await Future.delayed(const Duration(seconds: 2));

      try {
        final formData = formKey.currentState!.value;
        print(formData); // 打印表单数据

        Get.snackbar(
          '提交成功',
          '表单数据已成功提交',
          snackPosition: SnackPosition.bottom,
        );
      } catch (e) {
        Get.snackbar(
          '提交失败',
          '错误: ${e.toString()}',
          snackPosition: SnackPosition.bottom,
        );
      } finally {
        isLoading.value = false;
      }
    } else {
      Get.snackbar(
        '表单验证失败',
        '请检查表单中的错误',
        snackPosition: SnackPosition.bottom,
      );
    }
  }

  // 重置表单
  void resetForm() {
    formKey.currentState?.reset();
  }
}

class TrainerDialog extends GetResponsiveView<FormController> {
  TrainerDialog({super.key, bool update = false});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: FormBuilder(
        key: controller.formKey,
        child: Column(
          children: [
            FormBuilderTextField(
              name: 'username',
              decoration: const InputDecoration(
                labelText: '用户名',
                hintText: '输入3-20个字符',
              ),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: '用户名不能为空'),
                FormBuilderValidators.minLength(3, errorText: '至少3个字符'),
                FormBuilderValidators.maxLength(20, errorText: '最多20个字符'),
                FormBuilderValidators.match(
                  r'^[a-zA-Z0-9_]+$',
                  errorText: '只能包含字母、数字和下划线',
                ),
              ]),
            ),
            const SizedBox(height: 16),

            // 邮箱输入
            FormBuilderTextField(
              name: 'email',
              decoration: const InputDecoration(
                labelText: '邮箱',
                hintText: '输入有效的邮箱地址',
              ),
              keyboardType: TextInputType.emailAddress,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: '邮箱不能为空'),
                FormBuilderValidators.email(errorText: '请输入有效的邮箱'),
              ]),
            ),
            const SizedBox(height: 16),

            // 密码输入
            FormBuilderTextField(
              name: 'password',
              decoration: const InputDecoration(
                labelText: '密码',
                hintText: '至少8个字符，包含大写字母和数字',
              ),
              obscureText: true,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: '密码不能为空'),
                FormBuilderValidators.minLength(8, errorText: '至少8个字符'),
                FormBuilderValidators.match(
                  r'^(?=.*[A-Z])(?=.*\d).+$',
                  errorText: '必须包含大写字母和数字',
                ),
              ]),
            ),
            const SizedBox(height: 16),

            // 数字输入 - 年龄
            FormBuilderTextField(
              name: 'age',
              decoration: const InputDecoration(
                labelText: '年龄',
                hintText: '输入18-120之间的数字',
              ),
              keyboardType: TextInputType.number,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: '年龄不能为空'),
                FormBuilderValidators.numeric(errorText: '请输入数字'),
                FormBuilderValidators.min(18, errorText: '最小年龄18岁'),
                FormBuilderValidators.max(120, errorText: '最大年龄120岁'),
              ]),
            ),
            const SizedBox(height: 16),

            // 日期选择
            FormBuilderDateTimePicker(
              name: 'birth_date',
              decoration: const InputDecoration(
                labelText: '出生日期',
                hintText: '选择日期',
              ),
              inputType: InputType.date,
              format: DateFormat('yyyy-MM-dd'),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: '请选择出生日期'),
              ]),
            ),
            const SizedBox(height: 16),

            // 下拉选择
            FormBuilderDropdown<String>(
              name: 'gender',
              decoration: const InputDecoration(
                labelText: '性别',
                hintText: '选择性别',
              ),
              items: ['男', '女', '其他']
                  .map((gender) => DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      ))
                  .toList(),
              validator: FormBuilderValidators.required(errorText: '请选择性别'),
            ),
            const SizedBox(height: 16),

            // 单选按钮
            FormBuilderRadioGroup<String>(
              name: 'education',
              decoration: const InputDecoration(
                labelText: '学历',
              ),
              options: ['高中', '大专', '本科', '硕士', '博士']
                  .map((edu) => FormBuilderFieldOption(
                        value: edu,
                        child: Text(edu),
                      ))
                  .toList(),
              validator: FormBuilderValidators.required(errorText: '请选择学历'),
            ),
            const SizedBox(height: 16),

            // 多选框
            FormBuilderCheckboxGroup<String>(
              name: 'hobbies',
              decoration: const InputDecoration(
                labelText: '兴趣爱好',
              ),
              options: [
                '阅读',
                '运动',
                '音乐',
                '旅行',
                '游戏',
                '编程',
              ]
                  .map((hobby) => FormBuilderFieldOption(
                        value: hobby,
                        child: Text(hobby),
                      ))
                  .toList(),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: '请至少选择一项'),
                FormBuilderValidators.minLength(1, errorText: '请至少选择一项'),
              ]),
            ),
            const SizedBox(height: 16),

            // 开关
            FormBuilderSwitch(
              name: 'receive_newsletter',
              title: const Text('接收新闻邮件'),
              initialValue: false,
            ),
            const SizedBox(height: 24),

            // 提交按钮
            Obx(() => ElevatedButton(
                  onPressed:
                      controller.isLoading.value ? null : controller.submitForm,
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : const Text('提交'),
                )),
          ],
        ),
      ),
    );
  }
}

class TrainerView extends GetView<TrainerViewController> {
  TrainerView({super.key});

  final controler = Get.put(FormController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton.outlined(
              onPressed: () async {
                await showDialog<bool>(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("提示"),
                      content: TrainerDialog(),
                      actions: <Widget>[
                        TextButton(
                          child: Text("取消"),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        TextButton(
                          child: Text("删除"),
                          onPressed: () {
                            // 执行删除操作
                            // Navigator.of(context).pop(_withTree);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.add))
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

  Widget _buildDataTable(TrainerViewController controller) {
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
                  DataColumn2(
                    label: const Text('操作'),
                    size: ColumnSize.M,
                    // numeric: true,
                    // onSort: controller.sort,
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
                            DataCell(Text(
                                '\$${employee.salary.toStringAsFixed(2)}')),
                            DataCell(Row(
                              children: [
                                IconButton.outlined(
                                  onPressed: () {
                                    Get.snackbar("edit", "edit");
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
          _buildPaginationControls(controller),
        ],
      ),
    );
  }

  Widget _buildPaginationControls(TrainerViewController controller) {
    return Obx(() {
      final startItem =
          controller.currentPage.value * controller.rowsPerPage.value + 1;
      final endItem =
          (controller.currentPage.value + 1) * controller.rowsPerPage.value;
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
          Text(
              '$startItem-${endItem > totalItems ? totalItems : endItem} of $totalItems'),
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: controller.currentPage.value > 0
                ? controller.previousPage
                : null,
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: (controller.currentPage.value + 1) *
                        controller.rowsPerPage.value <
                    controller.employees.length
                ? controller.nextPage
                : null,
          ),
        ],
      );
    });
  }
}
