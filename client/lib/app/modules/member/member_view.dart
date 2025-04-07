import 'dart:math';
import 'package:intl/intl.dart' show NumberFormat;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'member_controller.dart';

class Member {
  Member(this.id, this.name, this.designation, this.salary);
  final int id;
  final String name;
  final String designation;
  final int salary;
}

class Employee {
  /// Creates the employee class with required details.
  Employee(
    this.employeeName,
    this.designation,
    this.mail,
    this.location,
    this.status,
    this.trustworthiness,
    this.softwareProficiency,
    this.salary,
    this.address,
  );

  /// Location of an employee.
  final String location;

  /// Name of an employee.
  final String employeeName;

  /// Designation of an employee.
  final String designation;

  /// Mail id of an employee.
  final String mail;

  /// Trustworthiness of an employee.
  final String trustworthiness;

  /// Status of an employee.
  final String status;

  /// Software proficiency of an employee.
  final int softwareProficiency;

  /// Salary of an employee.
  final int salary;

  /// Address of an employee.
  final String address;
}

class EmployeeDataGridSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataGridSource() {
    _employees = _obtainEmployees(20);
    _buildDataGridRows();
  }

  final Random _random = Random();
  List<DataGridRow> _dataGridRows = <DataGridRow>[];
  List<Employee> _employees = <Employee>[];

  /// Building DataGridRows
  void _buildDataGridRows() {
    _dataGridRows = _employees.map<DataGridRow>((Employee employee) {
      return DataGridRow(
        cells: <DataGridCell>[
          DataGridCell<String>(
            columnName: 'employeeName',
            value: employee.employeeName,
          ),
          DataGridCell<String>(
            columnName: 'designation',
            value: employee.designation,
          ),
          DataGridCell<String>(columnName: 'mail', value: employee.mail),
          DataGridCell<String>(
            columnName: 'location',
            value: employee.location,
          ),
          DataGridCell<String>(
            columnName: 'status',
            value: employee.status,
          ),
          DataGridCell<String>(
            columnName: 'trustworthiness',
            value: employee.trustworthiness,
          ),
          DataGridCell<int>(
            columnName: 'softwareProficiency',
            value: employee.softwareProficiency,
          ),
          DataGridCell<int>(columnName: 'salary', value: employee.salary),
          DataGridCell<String>(
            columnName: 'address',
            value: employee.address,
          ),
        ],
      );
    }).toList();
  }

  // Overrides
  @override
  List<DataGridRow> get rows => _dataGridRows;

  Widget _buildEmployeeName(dynamic value) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: _buildWidget(
        Icon(Icons.account_circle, size: 30, color: Colors.blue[300]),
        value,
      ),
    );
  }

  Widget _buildLocation(dynamic value) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: _buildWidget(const Icon(Icons.location_on, size: 20), value),
    );
  }

  Widget _buildTrustWorthiness(String value) {
    final String trust = value;
    if (value == 'Perfect') {
      return Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: _buildWidget(_images[trust]!, trust),
      );
    } else if (value == 'Insufficient') {
      return Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: _buildWidget(_images[trust]!, trust),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: _buildWidget(_images[trust]!, trust),
      );
    }
  }

  Widget _buildSoftwareProficiency(dynamic value) {
    Widget createLinearProgressBar(int progressValue) {
      return SizedBox(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 50,
              child: LinearProgressIndicator(
                value: progressValue / 100,
                valueColor: AlwaysStoppedAnimation<Color>(
                  progressValue < 50 ? Colors.red : Colors.green,
                ),
                backgroundColor:
                    progressValue < 50 ? Colors.red[100] : Colors.green[100],
              ),
            ),
            Text(' ' + (progressValue.toString() + '%')),
          ],
        ),
      );
    }

    return createLinearProgressBar(value);
  }

  Widget _buildWidget(Widget image, String text) {
    return Container(
      color: Colors.transparent,
      child: Row(
        children: <Widget>[
          Container(child: image),
          const SizedBox(width: 6),
          Expanded(child: Text(text, overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }

  TextStyle _styleForStatusText(dynamic value) {
    if (value == 'Active') {
      return const TextStyle(color: Colors.green);
    } else {
      return TextStyle(color: Colors.red[500]);
    }
  }

  final Map<String, Image> _images = <String, Image>{
    'Perfect': Image.asset('images/Perfect.png'),
    'Insufficient': Image.asset('images/Insufficient.png'),
    'Sufficient': Image.asset('images/Sufficient.png'),
  };

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: <Widget>[
        _buildEmployeeName(row.getCells()[0].value),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: Text(row.getCells()[1].value.toString()),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: Text(row.getCells()[2].value.toString()),
        ),
        _buildLocation(row.getCells()[3].value),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text(
            row.getCells()[4].value.toString(),
            style: _styleForStatusText(row.getCells()[4].value),
          ),
        ),
        _buildTrustWorthiness(row.getCells()[5].value.toString()),
        _buildSoftwareProficiency(row.getCells()[6].value),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerRight,
          child: Text(
            NumberFormat.currency(
              locale: 'en_US',
              symbol: r'$',
            ).format(row.getCells()[7].value),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: Text(row.getCells()[8].value.toString()),
        ),
      ],
    );
  }

  // Employee Data's
  final List<String> _employeeNames = <String>[
    'Michael',
    'Kathryn',
    'Tamer',
    'Martin',
    'Davolio',
    'Nancy',
    'Fuller',
    'Leverling',
    'Therasa',
    'Margaret',
    'Buchanan',
    'Janet',
    'Andrew',
    'Callahan',
    'Laura',
    'Dodsworth',
    'Anne',
    'Bergs',
    'Vinet',
    'Anto',
    'Fleet',
    'Zachery',
    'Van',
    'Edward',
    'Jack',
    'Rose',
  ];
  final List<String> _addresses = <String>[
    '59 rue de lAbbaye',
    'Luisenstr. 48',
    'Rua do Paço 67',
    '2 rue du Commerce',
    'Boulevard Tirou 255',
    'Rua do mailPaço 67',
    'Hauptstr. 31',
    'Starenweg 5',
    'Rua do Mercado ,12',
    'Carrera 22 con Ave.',
    'Carlos Soublette #8-35',
    'Kirchgasse 6',
    'Sierras de Granada 9993',
    'Mehrheimerstr. 369',
    'Rua da Panificadora 12',
    '2817 Milton Dr.',
    'Kirchgasse 6',
    'Åkergatan 24',
    '24, place Kléber',
    'Torikatu 38',
    'Berliner Platz 43',
    '5ª Ave. Los Palos Grandes',
    '1029 - 12th Ave. S.',
    'Torikatu 38',
    'P.O. Box 555',
    '2817 Milton Dr.',
    'Taucherstraße 10',
    '59 rue de lAbbaye',
    'Via Ludovico il Moro 22',
    'Avda. Azteca 123',
    'Heerstr. 22',
    'Berguvsvägen  8',
    'Magazinweg 7',
    'Berguvsvägen  8',
    'Gran Vía, 1',
    'Gran Vía, 1',
    'Bolívar #65-98 Llano Largo',
    'Magazinweg 7',
    'Taucherstraße 10',
    'Taucherstraße 10',
  ];
  final List<String> _designations = <String>[
    'Designer',
    'Manager',
    'Developer',
    'Project Lead',
    'Program Directory',
    'System Analyst',
    'CFO',
  ];
  final List<String> _mails = <String>[
    'arpy.com',
    'sample.com',
    'rpy.com',
    'jourrapide.com',
  ];
  final List<String> _status = <String>['Inactive', 'Active'];
  final List<String> _trusts = <String>[
    'Sufficient',
    'Perfect',
    'Insufficient',
  ];
  final List<String> _locations = <String>[
    'UK',
    'USA',
    'Sweden',
    'France',
    'Canada',
    'Argentina',
    'Austria',
    'Germany',
    'Mexico',
  ];

  List<Employee> _obtainEmployees(int count) {
    final List<Employee> employeeData = <Employee>[];
    for (int i = 0; i < _employeeNames.length - 1; i++) {
      employeeData.add(
        Employee(
          _employeeNames[i],
          _designations[_random.nextInt(_designations.length - 1)],
          _employeeNames[i].toLowerCase() +
              '@' +
              _mails[_random.nextInt(_mails.length - 1)],
          _locations[_random.nextInt(_locations.length - 1)],
          _status[_random.nextInt(_status.length)],
          _trusts[_random.nextInt(_trusts.length - 1)],
          20 + _random.nextInt(80),
          10000 + _random.nextInt(70000),
          _addresses[_random.nextInt(_addresses.length - 1)],
        ),
      );
    }
    return employeeData;
  }
}

class MemberDataSource extends DataGridSource {
  MemberDataSource({required List<Member> employees}) {
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

class MemberView extends GetView<MemberViewController> {
  const MemberView({super.key});

  List<Member> getEmployees() {
    return [
      Member(10001, 'James', 'Project Lead', 20000),
      Member(10002, 'Kathryn', 'Manager', 30000),
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
    // var employees = getEmployees();
    // var employeeDataSource = MemberDataSource(employees: employees);
    var employeeDataSource = EmployeeDataGridSource();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () async {}, icon: Icon(Icons.import_export)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SfDataGrid(
              source: employeeDataSource,
              columns: <GridColumn>[
                GridColumn(
                  width: 130,
                  columnName: 'employeeName',
                  label: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8.0),
                    child: const Text('Employee Name',
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                GridColumn(
                  columnName: 'designation',
                  width:
                      150, //(model.isWeb || model.isMacOS || model.isLinux) ? 150 : 130,
                  label: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(8.0),
                    child: const Text('Designation',
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                GridColumn(
                  columnName: 'mail',
                  width: 180.0,
                  label: Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.centerLeft,
                    child: const Text('Mail', overflow: TextOverflow.ellipsis),
                  ),
                ),
                GridColumn(
                  columnName: 'location',
                  width: 105, //model.isLinux ? 120.0 : 105.0,
                  label: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8.0),
                    child:
                        const Text('Location', overflow: TextOverflow.ellipsis),
                  ),
                ),
                GridColumn(
                  columnName: 'status',
                  label: Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child:
                        const Text('Status', overflow: TextOverflow.ellipsis),
                  ),
                ),
                GridColumn(
                  columnName: 'trustworthiness',
                  width: 130,
                  label: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      'Trustworthiness',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                GridColumn(
                  columnName: 'softwareProficiency',
                  width: 165,
                  label: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      'Software Proficiency',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                GridColumn(
                  columnName: 'salary',
                  label: Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.centerRight,
                    child:
                        const Text('Salary', overflow: TextOverflow.ellipsis),
                  ),
                ),
                GridColumn(
                  columnName: 'address',
                  width: 200,
                  label: Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(8.0),
                    child:
                        const Text('Address', overflow: TextOverflow.ellipsis),
                  ),
                ),
              ],
            ),
          ),
          SfDataPager(
            delegate: employeeDataSource,
            availableRowsPerPage: const <int>[15, 20, 25],
            pageCount: 2, //employeeDataSource.orders.length / _rowsPerPage,
            // onRowsPerPageChanged: (int? rowsPerPage) {
            //   setState(() {
            //     _rowsPerPage = rowsPerPage!;
            //   });
            // },
          )
        ],
      ),
    );
  }
}
