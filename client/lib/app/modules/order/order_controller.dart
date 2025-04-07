import 'package:get/get.dart';

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
class OrderViewController extends GetxController {
  // 状态变量
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
        {'id': 1, 'name': '张三', 'age': 28, 'department': '研发部', 'salary': 15000},
        {'id': 2, 'name': '李四', 'age': 32, 'department': '市场部', 'salary': 12000},
        {'id': 3, 'name': '王五', 'age': 25, 'department': '人事部', 'salary': 10000},
        {'id': 4, 'name': '赵六', 'age': 40, 'department': '财务部', 'salary': 18000},
        {'id': 5, 'name': '钱七', 'age': 35, 'department': '研发部', 'salary': 16000},
        {'id': 6, 'name': '孙八', 'age': 29, 'department': '市场部', 'salary': 11000},
        {'id': 7, 'name': '周九', 'age': 45, 'department': '管理层', 'salary': 25000},
        {'id': 8, 'name': '吴十', 'age': 31, 'department': '研发部', 'salary': 17000},
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
        employees.sort((a, b) => 
            ascending ? a.id.compareTo(b.id) : b.id.compareTo(a.id));
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
        employees.sort((a, b) => 
            ascending ? a.department.compareTo(b.department) : b.department.compareTo(a.department));
        break;
      case 4:
        employees.sort((a, b) => 
            ascending ? a.salary.compareTo(b.salary) : b.salary.compareTo(a.salary));
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
