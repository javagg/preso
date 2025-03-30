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

abstract class Permission implements _i1.TableRow, _i1.ProtocolSerialization {
  Permission._({
    this.id,
    required this.name,
    required this.description,
  });

  factory Permission({
    int? id,
    required String name,
    required String description,
  }) = _PermissionImpl;

  factory Permission.fromJson(Map<String, dynamic> jsonSerialization) {
    return Permission(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
    );
  }

  static final t = PermissionTable();

  static const db = PermissionRepository._();

  @override
  int? id;

  String name;

  String description;

  @override
  _i1.Table get table => t;

  /// Returns a shallow copy of this [Permission]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Permission copyWith({
    int? id,
    String? name,
    String? description,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'description': description,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'description': description,
    };
  }

  static PermissionInclude include() {
    return PermissionInclude._();
  }

  static PermissionIncludeList includeList({
    _i1.WhereExpressionBuilder<PermissionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PermissionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PermissionTable>? orderByList,
    PermissionInclude? include,
  }) {
    return PermissionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Permission.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Permission.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PermissionImpl extends Permission {
  _PermissionImpl({
    int? id,
    required String name,
    required String description,
  }) : super._(
          id: id,
          name: name,
          description: description,
        );

  /// Returns a shallow copy of this [Permission]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Permission copyWith({
    Object? id = _Undefined,
    String? name,
    String? description,
  }) {
    return Permission(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }
}

class PermissionTable extends _i1.Table {
  PermissionTable({super.tableRelation}) : super(tableName: 'permission') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        description,
      ];
}

class PermissionInclude extends _i1.IncludeObject {
  PermissionInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Permission.t;
}

class PermissionIncludeList extends _i1.IncludeList {
  PermissionIncludeList._({
    _i1.WhereExpressionBuilder<PermissionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Permission.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Permission.t;
}

class PermissionRepository {
  const PermissionRepository._();

  /// Returns a list of [Permission]s matching the given query parameters.
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
  Future<List<Permission>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PermissionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PermissionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PermissionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Permission>(
      where: where?.call(Permission.t),
      orderBy: orderBy?.call(Permission.t),
      orderByList: orderByList?.call(Permission.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Permission] matching the given query parameters.
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
  Future<Permission?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PermissionTable>? where,
    int? offset,
    _i1.OrderByBuilder<PermissionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PermissionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Permission>(
      where: where?.call(Permission.t),
      orderBy: orderBy?.call(Permission.t),
      orderByList: orderByList?.call(Permission.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Permission] by its [id] or null if no such row exists.
  Future<Permission?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Permission>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Permission]s in the list and returns the inserted rows.
  ///
  /// The returned [Permission]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Permission>> insert(
    _i1.Session session,
    List<Permission> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Permission>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Permission] and returns the inserted row.
  ///
  /// The returned [Permission] will have its `id` field set.
  Future<Permission> insertRow(
    _i1.Session session,
    Permission row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Permission>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Permission]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Permission>> update(
    _i1.Session session,
    List<Permission> rows, {
    _i1.ColumnSelections<PermissionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Permission>(
      rows,
      columns: columns?.call(Permission.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Permission]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Permission> updateRow(
    _i1.Session session,
    Permission row, {
    _i1.ColumnSelections<PermissionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Permission>(
      row,
      columns: columns?.call(Permission.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Permission]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Permission>> delete(
    _i1.Session session,
    List<Permission> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Permission>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Permission].
  Future<Permission> deleteRow(
    _i1.Session session,
    Permission row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Permission>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Permission>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PermissionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Permission>(
      where: where(Permission.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PermissionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Permission>(
      where: where?.call(Permission.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
