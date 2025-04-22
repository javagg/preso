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

abstract class Role implements _i1.TableRow<int>, _i1.ProtocolSerialization {
  Role._({
    this.id,
    required this.name,
    required this.description,
  });

  factory Role({
    int? id,
    required String name,
    required String description,
  }) = _RoleImpl;

  factory Role.fromJson(Map<String, dynamic> jsonSerialization) {
    return Role(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
    );
  }

  static final t = RoleTable();

  static const db = RoleRepository._();

  @override
  int? id;

  String name;

  String description;

  @override
  _i1.Table<int> get table => t;

  /// Returns a shallow copy of this [Role]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Role copyWith({
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

  static RoleInclude include() {
    return RoleInclude._();
  }

  static RoleIncludeList includeList({
    _i1.WhereExpressionBuilder<RoleTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RoleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RoleTable>? orderByList,
    RoleInclude? include,
  }) {
    return RoleIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Role.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Role.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RoleImpl extends Role {
  _RoleImpl({
    int? id,
    required String name,
    required String description,
  }) : super._(
          id: id,
          name: name,
          description: description,
        );

  /// Returns a shallow copy of this [Role]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Role copyWith({
    Object? id = _Undefined,
    String? name,
    String? description,
  }) {
    return Role(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }
}

class RoleTable extends _i1.Table<int> {
  RoleTable({super.tableRelation}) : super(tableName: 'role') {
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

class RoleInclude extends _i1.IncludeObject {
  RoleInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int> get table => Role.t;
}

class RoleIncludeList extends _i1.IncludeList {
  RoleIncludeList._({
    _i1.WhereExpressionBuilder<RoleTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Role.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int> get table => Role.t;
}

class RoleRepository {
  const RoleRepository._();

  /// Returns a list of [Role]s matching the given query parameters.
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
  Future<List<Role>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RoleTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RoleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RoleTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Role>(
      where: where?.call(Role.t),
      orderBy: orderBy?.call(Role.t),
      orderByList: orderByList?.call(Role.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Role] matching the given query parameters.
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
  Future<Role?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RoleTable>? where,
    int? offset,
    _i1.OrderByBuilder<RoleTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RoleTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Role>(
      where: where?.call(Role.t),
      orderBy: orderBy?.call(Role.t),
      orderByList: orderByList?.call(Role.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Role] by its [id] or null if no such row exists.
  Future<Role?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Role>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Role]s in the list and returns the inserted rows.
  ///
  /// The returned [Role]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Role>> insert(
    _i1.Session session,
    List<Role> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Role>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Role] and returns the inserted row.
  ///
  /// The returned [Role] will have its `id` field set.
  Future<Role> insertRow(
    _i1.Session session,
    Role row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Role>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Role]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Role>> update(
    _i1.Session session,
    List<Role> rows, {
    _i1.ColumnSelections<RoleTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Role>(
      rows,
      columns: columns?.call(Role.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Role]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Role> updateRow(
    _i1.Session session,
    Role row, {
    _i1.ColumnSelections<RoleTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Role>(
      row,
      columns: columns?.call(Role.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Role]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Role>> delete(
    _i1.Session session,
    List<Role> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Role>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Role].
  Future<Role> deleteRow(
    _i1.Session session,
    Role row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Role>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Role>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<RoleTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Role>(
      where: where(Role.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<RoleTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Role>(
      where: where?.call(Role.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
