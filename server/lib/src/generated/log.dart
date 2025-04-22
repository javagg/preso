/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'user.dart' as _i2;
import 'op_type.dart' as _i3;

abstract class Log implements _i1.TableRow<int>, _i1.ProtocolSerialization {
  Log._({
    this.id,
    required this.tenantId,
    required this.operationTime,
    required this.createrId,
    this.creater,
    required this.type,
    required this.operatee,
  });

  factory Log({
    int? id,
    required int tenantId,
    required DateTime operationTime,
    required int createrId,
    _i2.User? creater,
    required _i3.OpType type,
    required String operatee,
  }) = _LogImpl;

  factory Log.fromJson(Map<String, dynamic> jsonSerialization) {
    return Log(
      id: jsonSerialization['id'] as int?,
      tenantId: jsonSerialization['tenantId'] as int,
      operationTime: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['operationTime']),
      createrId: jsonSerialization['createrId'] as int,
      creater: jsonSerialization['creater'] == null
          ? null
          : _i2.User.fromJson(
              (jsonSerialization['creater'] as Map<String, dynamic>)),
      type: _i3.OpType.fromJson((jsonSerialization['type'] as String)),
      operatee: jsonSerialization['operatee'] as String,
    );
  }

  static final t = LogTable();

  static const db = LogRepository._();

  @override
  int? id;

  int tenantId;

  DateTime operationTime;

  int createrId;

  _i2.User? creater;

  _i3.OpType type;

  String operatee;

  @override
  _i1.Table<int> get table => t;

  /// Returns a shallow copy of this [Log]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Log copyWith({
    int? id,
    int? tenantId,
    DateTime? operationTime,
    int? createrId,
    _i2.User? creater,
    _i3.OpType? type,
    String? operatee,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'tenantId': tenantId,
      'operationTime': operationTime.toJson(),
      'createrId': createrId,
      if (creater != null) 'creater': creater?.toJson(),
      'type': type.toJson(),
      'operatee': operatee,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'tenantId': tenantId,
      'operationTime': operationTime.toJson(),
      'createrId': createrId,
      if (creater != null) 'creater': creater?.toJsonForProtocol(),
      'type': type.toJson(),
      'operatee': operatee,
    };
  }

  static LogInclude include({_i2.UserInclude? creater}) {
    return LogInclude._(creater: creater);
  }

  static LogIncludeList includeList({
    _i1.WhereExpressionBuilder<LogTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LogTable>? orderByList,
    LogInclude? include,
  }) {
    return LogIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Log.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Log.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LogImpl extends Log {
  _LogImpl({
    int? id,
    required int tenantId,
    required DateTime operationTime,
    required int createrId,
    _i2.User? creater,
    required _i3.OpType type,
    required String operatee,
  }) : super._(
          id: id,
          tenantId: tenantId,
          operationTime: operationTime,
          createrId: createrId,
          creater: creater,
          type: type,
          operatee: operatee,
        );

  /// Returns a shallow copy of this [Log]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Log copyWith({
    Object? id = _Undefined,
    int? tenantId,
    DateTime? operationTime,
    int? createrId,
    Object? creater = _Undefined,
    _i3.OpType? type,
    String? operatee,
  }) {
    return Log(
      id: id is int? ? id : this.id,
      tenantId: tenantId ?? this.tenantId,
      operationTime: operationTime ?? this.operationTime,
      createrId: createrId ?? this.createrId,
      creater: creater is _i2.User? ? creater : this.creater?.copyWith(),
      type: type ?? this.type,
      operatee: operatee ?? this.operatee,
    );
  }
}

class LogTable extends _i1.Table<int> {
  LogTable({super.tableRelation}) : super(tableName: 'log') {
    tenantId = _i1.ColumnInt(
      'tenantId',
      this,
    );
    operationTime = _i1.ColumnDateTime(
      'operationTime',
      this,
    );
    createrId = _i1.ColumnInt(
      'createrId',
      this,
    );
    type = _i1.ColumnEnum(
      'type',
      this,
      _i1.EnumSerialization.byName,
    );
    operatee = _i1.ColumnString(
      'operatee',
      this,
    );
  }

  late final _i1.ColumnInt tenantId;

  late final _i1.ColumnDateTime operationTime;

  late final _i1.ColumnInt createrId;

  _i2.UserTable? _creater;

  late final _i1.ColumnEnum<_i3.OpType> type;

  late final _i1.ColumnString operatee;

  _i2.UserTable get creater {
    if (_creater != null) return _creater!;
    _creater = _i1.createRelationTable(
      relationFieldName: 'creater',
      field: Log.t.createrId,
      foreignField: _i2.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserTable(tableRelation: foreignTableRelation),
    );
    return _creater!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        tenantId,
        operationTime,
        createrId,
        type,
        operatee,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'creater') {
      return creater;
    }
    return null;
  }
}

class LogInclude extends _i1.IncludeObject {
  LogInclude._({_i2.UserInclude? creater}) {
    _creater = creater;
  }

  _i2.UserInclude? _creater;

  @override
  Map<String, _i1.Include?> get includes => {'creater': _creater};

  @override
  _i1.Table<int> get table => Log.t;
}

class LogIncludeList extends _i1.IncludeList {
  LogIncludeList._({
    _i1.WhereExpressionBuilder<LogTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Log.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int> get table => Log.t;
}

class LogRepository {
  const LogRepository._();

  final attachRow = const LogAttachRowRepository._();

  /// Returns a list of [Log]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Log>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LogTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LogTable>? orderByList,
    _i1.Transaction? transaction,
    LogInclude? include,
  }) async {
    return session.db.find<Log>(
      where: where?.call(Log.t),
      orderBy: orderBy?.call(Log.t),
      orderByList: orderByList?.call(Log.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Log] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Log?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LogTable>? where,
    int? offset,
    _i1.OrderByBuilder<LogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LogTable>? orderByList,
    _i1.Transaction? transaction,
    LogInclude? include,
  }) async {
    return session.db.findFirstRow<Log>(
      where: where?.call(Log.t),
      orderBy: orderBy?.call(Log.t),
      orderByList: orderByList?.call(Log.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Log] by its [id] or null if no such row exists.
  Future<Log?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    LogInclude? include,
  }) async {
    return session.db.findById<Log>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Log]s in the list and returns the inserted rows.
  ///
  /// The returned [Log]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Log>> insert(
    _i1.Session session,
    List<Log> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Log>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Log] and returns the inserted row.
  ///
  /// The returned [Log] will have its `id` field set.
  Future<Log> insertRow(
    _i1.Session session,
    Log row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Log>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Log]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Log>> update(
    _i1.Session session,
    List<Log> rows, {
    _i1.ColumnSelections<LogTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Log>(
      rows,
      columns: columns?.call(Log.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Log]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Log> updateRow(
    _i1.Session session,
    Log row, {
    _i1.ColumnSelections<LogTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Log>(
      row,
      columns: columns?.call(Log.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Log]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Log>> delete(
    _i1.Session session,
    List<Log> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Log>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Log].
  Future<Log> deleteRow(
    _i1.Session session,
    Log row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Log>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Log>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<LogTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Log>(
      where: where(Log.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LogTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Log>(
      where: where?.call(Log.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class LogAttachRowRepository {
  const LogAttachRowRepository._();

  /// Creates a relation between the given [Log] and [User]
  /// by setting the [Log]'s foreign key `createrId` to refer to the [User].
  Future<void> creater(
    _i1.Session session,
    Log log,
    _i2.User creater, {
    _i1.Transaction? transaction,
  }) async {
    if (log.id == null) {
      throw ArgumentError.notNull('log.id');
    }
    if (creater.id == null) {
      throw ArgumentError.notNull('creater.id');
    }

    var $log = log.copyWith(createrId: creater.id);
    await session.db.updateRow<Log>(
      $log,
      columns: [Log.t.createrId],
      transaction: transaction,
    );
  }
}
