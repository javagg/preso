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

abstract class Bargain implements _i1.TableRow<int>, _i1.ProtocolSerialization {
  Bargain._({
    this.id,
    required this.name,
  });

  factory Bargain({
    int? id,
    required String name,
  }) = _BargainImpl;

  factory Bargain.fromJson(Map<String, dynamic> jsonSerialization) {
    return Bargain(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
    );
  }

  static final t = BargainTable();

  static const db = BargainRepository._();

  @override
  int? id;

  String name;

  @override
  _i1.Table<int> get table => t;

  /// Returns a shallow copy of this [Bargain]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Bargain copyWith({
    int? id,
    String? name,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
    };
  }

  static BargainInclude include() {
    return BargainInclude._();
  }

  static BargainIncludeList includeList({
    _i1.WhereExpressionBuilder<BargainTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BargainTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BargainTable>? orderByList,
    BargainInclude? include,
  }) {
    return BargainIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Bargain.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Bargain.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BargainImpl extends Bargain {
  _BargainImpl({
    int? id,
    required String name,
  }) : super._(
          id: id,
          name: name,
        );

  /// Returns a shallow copy of this [Bargain]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Bargain copyWith({
    Object? id = _Undefined,
    String? name,
  }) {
    return Bargain(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
    );
  }
}

class BargainTable extends _i1.Table<int> {
  BargainTable({super.tableRelation}) : super(tableName: 'bargain') {
    name = _i1.ColumnString(
      'name',
      this,
    );
  }

  late final _i1.ColumnString name;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
      ];
}

class BargainInclude extends _i1.IncludeObject {
  BargainInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int> get table => Bargain.t;
}

class BargainIncludeList extends _i1.IncludeList {
  BargainIncludeList._({
    _i1.WhereExpressionBuilder<BargainTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Bargain.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int> get table => Bargain.t;
}

class BargainRepository {
  const BargainRepository._();

  /// Returns a list of [Bargain]s matching the given query parameters.
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
  Future<List<Bargain>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BargainTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BargainTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BargainTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Bargain>(
      where: where?.call(Bargain.t),
      orderBy: orderBy?.call(Bargain.t),
      orderByList: orderByList?.call(Bargain.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Bargain] matching the given query parameters.
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
  Future<Bargain?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BargainTable>? where,
    int? offset,
    _i1.OrderByBuilder<BargainTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BargainTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Bargain>(
      where: where?.call(Bargain.t),
      orderBy: orderBy?.call(Bargain.t),
      orderByList: orderByList?.call(Bargain.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Bargain] by its [id] or null if no such row exists.
  Future<Bargain?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Bargain>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Bargain]s in the list and returns the inserted rows.
  ///
  /// The returned [Bargain]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Bargain>> insert(
    _i1.Session session,
    List<Bargain> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Bargain>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Bargain] and returns the inserted row.
  ///
  /// The returned [Bargain] will have its `id` field set.
  Future<Bargain> insertRow(
    _i1.Session session,
    Bargain row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Bargain>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Bargain]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Bargain>> update(
    _i1.Session session,
    List<Bargain> rows, {
    _i1.ColumnSelections<BargainTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Bargain>(
      rows,
      columns: columns?.call(Bargain.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Bargain]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Bargain> updateRow(
    _i1.Session session,
    Bargain row, {
    _i1.ColumnSelections<BargainTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Bargain>(
      row,
      columns: columns?.call(Bargain.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Bargain]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Bargain>> delete(
    _i1.Session session,
    List<Bargain> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Bargain>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Bargain].
  Future<Bargain> deleteRow(
    _i1.Session session,
    Bargain row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Bargain>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Bargain>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<BargainTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Bargain>(
      where: where(Bargain.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BargainTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Bargain>(
      where: where?.call(Bargain.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
