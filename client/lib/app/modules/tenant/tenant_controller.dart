import 'dart:async';
import 'dart:math';

import 'package:faker/faker.dart';
import 'package:get/get.dart';
import 'package:trina_grid/trina_grid.dart';

const multilingualWords = [
  'معایبی',
  'دارد',
  'روغن',
  'شریعتی',
  'زنده‌یاد',
  'ante',
  'arcu',
  'at',
  'auctor',
  'augue',
  'bibendum',
  'blandit',
  'commodo',
  'condimentum',
  'congue',
  'consectetur',
  'Лорем',
  'ипсум',
  'долор',
  'сит',
  'амет',
  'करती',
  'और्४५०',
  'वर्णित',
  'प्राथमिक',
  'विभाग',
  '田',
  '民',
  '知',
  '新',
  '雌',
  'את',
  'שנורו',
  'המזנון',
  'או',
  '한글',
  '데이터 그리드',
  '떡볶이',
  '라면',
  '짜장면',
  '김치볶음밥',
];

class DummyData {
  late List<TrinaColumn> columns;

  late List<TrinaRow> rows;

  DummyData(
    int columnLength,
    int rowLength, {
    List<int> leftFrozenColumnIndexes = const [],
    List<int> rightFrozenColumnIndexes = const [],
  }) {
    var faker = Faker();

    columns = List<int>.generate(columnLength, (index) => index).map((i) {
      return TrinaColumn(
        title: faker.food.cuisine(),
        field: i.toString(),
        readOnly: [1, 3, 5].contains(i),
        type: (int i) {
          if (i == 0) {
            return TrinaColumnType.number();
          } else if (i == 1) {
            return TrinaColumnType.currency();
          } else if (i == 2) {
            return TrinaColumnType.text();
          } else if (i == 3) {
            return TrinaColumnType.text();
          } else if (i == 4) {
            return TrinaColumnType.select(<String>[
              'One',
              'Two',
              'Three',
              'Four',
              'Five',
            ]);
          } else if (i == 5) {
            return TrinaColumnType.select(<String>[
              'One',
              'Two',
              'Three',
              'Four',
              'Five',
            ]);
          } else if (i == 6) {
            return TrinaColumnType.date();
          } else if (i == 7) {
            return TrinaColumnType.time();
          } else {
            return TrinaColumnType.text();
          }
        }(i),
        frozen: (int i) {
          if (leftFrozenColumnIndexes.contains(i)) {
            return TrinaColumnFrozen.start;
          }
          if (rightFrozenColumnIndexes.contains(i)) {
            return TrinaColumnFrozen.end;
          }
          return TrinaColumnFrozen.none;
        }(i),
      );
    }).toList();

    rows = rowsByColumns(length: rowLength, columns: columns);
  }

  static List<TrinaColumn> textColumns(int count) {
    return List<int>.generate(count, (index) => index).map((i) {
      return TrinaColumn(
        title: faker.food.cuisine(),
        field: i.toString(),
        type: TrinaColumnType.text(),
      );
    }).toList();
  }

  static List<TrinaRow> rowsByColumns({
    required int length,
    required List<TrinaColumn> columns,
  }) {
    return List<int>.generate(length, (index) => index).map((_) {
      return rowByColumns(columns);
    }).toList();
  }

  static TrinaRow rowByColumns(List<TrinaColumn> columns) {
    return TrinaRow(cells: _cellsByColumn(columns));
  }

  static dynamic valueByColumnType(TrinaColumn column) {
    if (column.type.isNumber || column.type.isCurrency) {
      return faker.randomGenerator.decimal(scale: 1000000000, min: -500000000);
    } else if (column.type.isSelect) {
      return (column.type.select.items.toList()..shuffle()).first;
    } else if (column.type.isDate) {
      return DateTime.now()
          .add(Duration(days: faker.randomGenerator.integer(365, min: -365)))
          .toString();
    } else if (column.type.isTime) {
      final hour = faker.randomGenerator.integer(12).toString().padLeft(2, '0');
      final minute =
          faker.randomGenerator.integer(60).toString().padLeft(2, '0');
      return '$hour:$minute';
    } else {
      return faker.randomGenerator.element(multilingualWords);
    }
  }

  /// Repeat [chunkSize] as many times as [chunkCount] times.
  /// If chunkSize is 10 and chunkCount is 2,
  /// it repeats 10 rows twice and returns a total of 20 rows.
  static Future<List<TrinaRow>> fetchRows(
    List<TrinaColumn> columns, {
    int chunkCount = 100,
    int chunkSize = 100,
  }) {
    final Completer<List<TrinaRow>> completer = Completer();

    final List<TrinaRow> _rows = [];

    int count = 0;

    int totalRows = chunkSize * chunkCount;

    Timer.periodic(const Duration(milliseconds: 1), (timer) {
      if (count == chunkCount) {
        return;
      }

      ++count;

      Future(() {
        return DummyData.rowsByColumns(length: chunkSize, columns: columns);
      }).then((value) {
        _rows.addAll(value);

        if (_rows.length == totalRows) {
          completer.complete(_rows);

          timer.cancel();
        }
      });
    });

    return completer.future;
  }

  static List<TrinaRow> treeRowsByColumn({
    required List<TrinaColumn> columns,
    int count = 100,
    int? depth,
    List<int>? childCount,
  }) {
    assert(depth == null || depth >= 0);
    assert(childCount == null || childCount.length == depth);

    const defaultRandomDepth = 5;
    const defaultRandomChildCount = 10;

    TrinaRowType? generateType(int maxDepth, List<int> countOfChildren) {
      if (maxDepth < 1) return null;

      final TrinaRowType type = TrinaRowType.group(
        children: FilteredList(
          initialList: [],
        ),
      );
      List<TrinaRow>? currentChildren = type.group.children;
      List<List<TrinaRow>> childrenStack = [];
      List<List<TrinaRow>> childrenStackTemp = [];
      int currentDepth = 0;
      bool next = true;

      while (currentDepth < maxDepth || currentChildren != null) {
        bool isMax = currentDepth + 1 == maxDepth;
        next = childrenStack.isEmpty;

        if (currentChildren != null) {
          for (final _
              in List.generate(countOfChildren[currentDepth], (i) => i)) {
            final children = <TrinaRow>[];
            currentChildren.add(TrinaRow(
              cells: _cellsByColumn(columns),
              type: isMax
                  ? null
                  : TrinaRowType.group(
                      children: FilteredList(
                        initialList: children,
                      ),
                    ),
            ));

            if (!isMax) childrenStackTemp.add(children);
          }
        }

        if (next) {
          childrenStack = [...childrenStackTemp];
          childrenStackTemp = [];
        }

        currentChildren = childrenStack.isNotEmpty ? childrenStack.last : null;
        if (currentChildren != null) childrenStack.removeLast();

        if (next) ++currentDepth;
      }

      return type;
    }

    final rows = <TrinaRow>[];

    for (final _ in List.generate(count, (index) => index)) {
      TrinaRowType? type;

      final depthOrRandom = depth ??
          faker.randomGenerator.integer(
            defaultRandomDepth,
            min: 0,
          );

      final countOfChildren = childCount ??
          List.generate(depthOrRandom, (index) {
            return faker.randomGenerator.integer(
              defaultRandomChildCount,
              min: 0,
            );
          });

      type = depthOrRandom == 0
          ? null
          : generateType(depthOrRandom, countOfChildren);

      rows.add(
        TrinaRow(
          cells: _cellsByColumn(columns),
          type: type,
        ),
      );
    }

    return rows;
  }

  static Map<String, TrinaCell> _cellsByColumn(List<TrinaColumn> columns) {
    final cells = <String, TrinaCell>{};

    for (var column in columns) {
      cells[column.field] = TrinaCell(
        value: valueByColumnType(column),
      );
    }

    return cells;
  }
}

class TenantController extends GetxController {
  late final TrinaGridStateManager stateManager;

  final List<TrinaColumn> columns = [];

  // Pass an empty row to the grid initially.
  final List<TrinaRow> rows = [];

  final List<TrinaRow> fakeFetchedRows = [];

  @override
  void onReady() {
    super.onReady();

    final dummyData = DummyData(10, 1000);
    columns.addAll(dummyData.columns);
    fakeFetchedRows.addAll(dummyData.rows);
  }

  Future<TrinaLazyPaginationResponse> fetch(
    TrinaLazyPaginationRequest request,
  ) async {
    List<TrinaRow> tempList = fakeFetchedRows;

    // If you have a filtering state,
    // you need to implement it so that the user gets data from the server
    // according to the filtering state.
    //
    // request.page is 1 when the filtering state changes.
    // This is because, when the filtering state is changed,
    // the first page must be loaded with the new filtering applied.
    //
    // request.filterRows is a List<TrinaRow> type containing filtering information.
    // To convert to Map type, you can do as follows.
    //
    // FilterHelper.convertRowsToMap(request.filterRows);
    //
    // When the filter of abc is applied as Contains type to column2
    // and 123 as Contains type to column3, for example
    // It is returned as below.
    // {column2: [{Contains: 123}], column3: [{Contains: abc}]}
    //
    // If multiple filtering conditions are set in one column,
    // multiple conditions are included as shown below.
    // {column2: [{Contains: abc}, {Contains: 123}]}
    //
    // The filter type in FilterHelper.defaultFilters is the default,
    // If there is user-defined filtering,
    // the title set by the user is returned as the filtering type.
    // All filtering can change the value returned as a filtering type by changing the name property.
    // In case of TrinaFilterTypeContains filter, if you change the static type name to include
    // TrinaFilterTypeContains.name = 'include';
    // {column2: [{include: abc}, {include: 123}]} will be returned.
    if (request.filterRows.isNotEmpty) {
      final filter = FilterHelper.convertRowsToFilter(
        request.filterRows,
        stateManager.refColumns,
      );

      tempList = fakeFetchedRows.where(filter!).toList();
    }

    // If there is a sort state,
    // you need to implement it so that the user gets data from the server
    // according to the sort state.
    //
    // request.page is 1 when the sort state changes.
    // This is because when the sort state changes,
    // new data to which the sort state is applied must be loaded.
    if (request.sortColumn != null && !request.sortColumn!.sort.isNone) {
      tempList = [...tempList];

      tempList.sort((a, b) {
        final sortA = request.sortColumn!.sort.isAscending ? a : b;
        final sortB = request.sortColumn!.sort.isAscending ? b : a;

        return request.sortColumn!.type.compare(
          sortA.cells[request.sortColumn!.field]!.valueForSorting,
          sortB.cells[request.sortColumn!.field]!.valueForSorting,
        );
      });
    }

    final page = request.page;
    const pageSize = 100;
    final totalPage = (tempList.length / pageSize).ceil();
    final start = (page - 1) * pageSize;
    final end = start + pageSize;

    Iterable<TrinaRow> fetchedRows = tempList.getRange(
      max(0, start),
      min(tempList.length, end),
    );

    await Future.delayed(const Duration(milliseconds: 500));

    return Future.value(TrinaLazyPaginationResponse(
      totalPage: totalPage,
      rows: fetchedRows.toList(),
    ));
  }
}
