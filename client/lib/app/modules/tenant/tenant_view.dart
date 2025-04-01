import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'tenant_controller.dart';
import '../../../serverpod_client.dart' as pod;

class Member {
  Member(this.id, this.name, this.designation, this.salary);
  final int id;
  final String name;
  final String designation;
  final int salary;
}

class _DataSource extends DataGridSource {
  _DataSource({required List<Member> employees}) {
    _employees = employees
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(
                  columnName: 'designation', value: e.designation),
              DataGridCell<int>(columnName: 'salary', value: e.salary),
            ]))
        .toList();
  }

  List<DataGridRow> _employees = [];

  @override
  List<DataGridRow> get rows => _employees;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        alignment: (dataGridCell.columnName == 'id' ||
                dataGridCell.columnName == 'salary')
            ? Alignment.centerRight
            : Alignment.centerLeft,
        padding: EdgeInsets.all(16.0),
        child: Text(dataGridCell.value.toString()),
      );
    }).toList());
  }
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
          IconButton(onPressed: () async {}, icon: Icon(Icons.import_export))
        ],
      ),
      body: FutureBuilder(
        future: getEmployees(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            var employees = snapshot.data ?? [];
            return SfDataGrid(
              source: _DataSource(employees: employees),
              columns: <GridColumn>[
                GridColumn(
                    columnName: 'id',
                    label: Container(
                        padding: EdgeInsets.all(16.0),
                        alignment: Alignment.centerRight,
                        child: Text(
                          'ID',
                        ))),
                GridColumn(
                    columnName: 'name',
                    label: Container(
                        padding: EdgeInsets.all(16.0),
                        alignment: Alignment.centerLeft,
                        child: Text('Name'))),
                GridColumn(
                    columnName: 'designation',
                    width: 120,
                    label: Container(
                        padding: EdgeInsets.all(16.0),
                        alignment: Alignment.centerLeft,
                        child: Text('Designation'))),
                GridColumn(
                    columnName: 'salary',
                    label: Container(
                        padding: EdgeInsets.all(16.0),
                        alignment: Alignment.centerRight,
                        child: Text('Salary'))),
              ],
            );
          }
        },
      ),
    );
  }
}
