import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trina_grid/trina_grid.dart';
import 'tenant_controller.dart';
import '../../../serverpod_client.dart' as pod;

class Member {
  Member(this.id, this.name, this.designation, this.salary);
  final int id;
  final String name;
  final String designation;
  final int salary;
}

class TenantView extends GetView<TenantController> {
  const TenantView({super.key});

  Future<List<Member>> getEmployees() async {
    var tenants = await pod.client.tenant.all(10, 0);

    return [
      Member(10001, 'James121', 'Project Lead', 20000),
      Member(10002, '张三', 'Manager', 30000),
      Member(10003, 'Lara', 'Developer', 15000),
      Member(10004, 'Michael', 'Designer', 15000),
      Member(10005, 'Martin', 'Developer', 15000),
      Member(10006, 'Newberry', 'Developer', 15000),
      Member(10007, 'Balnc', 'Developer', 15000),
      Member(10008, 'Perry', 'Developer', 15000),
      Member(10009, 'Gable', 'Developer', 15000),
      Member(10010, 'Grimes', 'Developer', 15000)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {}, icon: Icon(Icons.import_export_outlined))
        ],
      ),
      body: TrinaGrid(
        columns: controller.columns,
        rows: controller.rows,
        onLoaded: (event) {
          controller.stateManager = event.stateManager;
          controller.stateManager.setShowColumnFilter(true);
        },
        configuration: const TrinaGridConfiguration(),
        createFooter: (stateManager) {
          return TrinaLazyPagination(
            fetch: controller.fetch,
            stateManager: stateManager,
          );
        },
      ),
    );
  }
}
