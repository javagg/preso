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

abstract class Coupon implements _i1.TableRow, _i1.ProtocolSerialization {
  Coupon._({
    this.id,
    required this.name,
  });

  factory Coupon({
    int? id,
    required String name,
  }) = _CouponImpl;

  factory Coupon.fromJson(Map<String, dynamic> jsonSerialization) {
    return Coupon(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
    );
  }

  static final t = CouponTable();

  static const db = CouponRepository._();

  @override
  int? id;

  String name;

  @override
  _i1.Table get table => t;

  /// Returns a shallow copy of this [Coupon]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Coupon copyWith({
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

  static CouponInclude include() {
    return CouponInclude._();
  }

  static CouponIncludeList includeList({
    _i1.WhereExpressionBuilder<CouponTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CouponTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CouponTable>? orderByList,
    CouponInclude? include,
  }) {
    return CouponIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Coupon.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Coupon.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CouponImpl extends Coupon {
  _CouponImpl({
    int? id,
    required String name,
  }) : super._(
          id: id,
          name: name,
        );

  /// Returns a shallow copy of this [Coupon]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Coupon copyWith({
    Object? id = _Undefined,
    String? name,
  }) {
    return Coupon(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
    );
  }
}

class CouponTable extends _i1.Table {
  CouponTable({super.tableRelation}) : super(tableName: 'coupon') {
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

class CouponInclude extends _i1.IncludeObject {
  CouponInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Coupon.t;
}

class CouponIncludeList extends _i1.IncludeList {
  CouponIncludeList._({
    _i1.WhereExpressionBuilder<CouponTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Coupon.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Coupon.t;
}

class CouponRepository {
  const CouponRepository._();

  /// Returns a list of [Coupon]s matching the given query parameters.
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
  Future<List<Coupon>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CouponTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CouponTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CouponTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Coupon>(
      where: where?.call(Coupon.t),
      orderBy: orderBy?.call(Coupon.t),
      orderByList: orderByList?.call(Coupon.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Coupon] matching the given query parameters.
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
  Future<Coupon?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CouponTable>? where,
    int? offset,
    _i1.OrderByBuilder<CouponTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CouponTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Coupon>(
      where: where?.call(Coupon.t),
      orderBy: orderBy?.call(Coupon.t),
      orderByList: orderByList?.call(Coupon.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Coupon] by its [id] or null if no such row exists.
  Future<Coupon?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Coupon>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Coupon]s in the list and returns the inserted rows.
  ///
  /// The returned [Coupon]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Coupon>> insert(
    _i1.Session session,
    List<Coupon> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Coupon>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Coupon] and returns the inserted row.
  ///
  /// The returned [Coupon] will have its `id` field set.
  Future<Coupon> insertRow(
    _i1.Session session,
    Coupon row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Coupon>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Coupon]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Coupon>> update(
    _i1.Session session,
    List<Coupon> rows, {
    _i1.ColumnSelections<CouponTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Coupon>(
      rows,
      columns: columns?.call(Coupon.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Coupon]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Coupon> updateRow(
    _i1.Session session,
    Coupon row, {
    _i1.ColumnSelections<CouponTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Coupon>(
      row,
      columns: columns?.call(Coupon.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Coupon]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Coupon>> delete(
    _i1.Session session,
    List<Coupon> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Coupon>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Coupon].
  Future<Coupon> deleteRow(
    _i1.Session session,
    Coupon row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Coupon>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Coupon>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CouponTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Coupon>(
      where: where(Coupon.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CouponTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Coupon>(
      where: where?.call(Coupon.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
