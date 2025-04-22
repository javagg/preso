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

abstract class Tenant implements _i1.TableRow<int>, _i1.ProtocolSerialization {
  Tenant._({
    this.id,
    required this.name,
    required this.description,
  });

  factory Tenant({
    int? id,
    required String name,
    required String description,
  }) = _TenantImpl;

  factory Tenant.fromJson(Map<String, dynamic> jsonSerialization) {
    return Tenant(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
    );
  }

  static final t = TenantTable();

  static const db = TenantRepository._();

  @override
  int? id;

  String name;

  String description;

  @override
  _i1.Table<int> get table => t;

  /// Returns a shallow copy of this [Tenant]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Tenant copyWith({
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

  static TenantInclude include() {
    return TenantInclude._();
  }

  static TenantIncludeList includeList({
    _i1.WhereExpressionBuilder<TenantTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TenantTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TenantTable>? orderByList,
    TenantInclude? include,
  }) {
    return TenantIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Tenant.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Tenant.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TenantImpl extends Tenant {
  _TenantImpl({
    int? id,
    required String name,
    required String description,
  }) : super._(
          id: id,
          name: name,
          description: description,
        );

  /// Returns a shallow copy of this [Tenant]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Tenant copyWith({
    Object? id = _Undefined,
    String? name,
    String? description,
  }) {
    return Tenant(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }
}

class TenantTable extends _i1.Table<int> {
  TenantTable({super.tableRelation}) : super(tableName: 'tenant') {
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

class TenantInclude extends _i1.IncludeObject {
  TenantInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int> get table => Tenant.t;
}

class TenantIncludeList extends _i1.IncludeList {
  TenantIncludeList._({
    _i1.WhereExpressionBuilder<TenantTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Tenant.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int> get table => Tenant.t;
}

class TenantRepository {
  const TenantRepository._();

  /// Returns a list of [Tenant]s matching the given query parameters.
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
  Future<List<Tenant>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TenantTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TenantTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TenantTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Tenant>(
      where: where?.call(Tenant.t),
      orderBy: orderBy?.call(Tenant.t),
      orderByList: orderByList?.call(Tenant.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Tenant] matching the given query parameters.
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
  Future<Tenant?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TenantTable>? where,
    int? offset,
    _i1.OrderByBuilder<TenantTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TenantTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Tenant>(
      where: where?.call(Tenant.t),
      orderBy: orderBy?.call(Tenant.t),
      orderByList: orderByList?.call(Tenant.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Tenant] by its [id] or null if no such row exists.
  Future<Tenant?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Tenant>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Tenant]s in the list and returns the inserted rows.
  ///
  /// The returned [Tenant]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Tenant>> insert(
    _i1.Session session,
    List<Tenant> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Tenant>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Tenant] and returns the inserted row.
  ///
  /// The returned [Tenant] will have its `id` field set.
  Future<Tenant> insertRow(
    _i1.Session session,
    Tenant row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Tenant>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Tenant]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Tenant>> update(
    _i1.Session session,
    List<Tenant> rows, {
    _i1.ColumnSelections<TenantTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Tenant>(
      rows,
      columns: columns?.call(Tenant.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Tenant]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Tenant> updateRow(
    _i1.Session session,
    Tenant row, {
    _i1.ColumnSelections<TenantTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Tenant>(
      row,
      columns: columns?.call(Tenant.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Tenant]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Tenant>> delete(
    _i1.Session session,
    List<Tenant> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Tenant>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Tenant].
  Future<Tenant> deleteRow(
    _i1.Session session,
    Tenant row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Tenant>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Tenant>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TenantTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Tenant>(
      where: where(Tenant.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TenantTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Tenant>(
      where: where?.call(Tenant.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
