/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

part of 'tenantable.dart';

abstract class Invoice extends _i1.Tenantable
    implements _i2.TableRow, _i2.ProtocolSerialization {
  Invoice._({
    this.id,
    required super.tenantId,
    required this.name,
  });

  factory Invoice({
    int? id,
    required int tenantId,
    required String name,
  }) = _InvoiceImpl;

  factory Invoice.fromJson(Map<String, dynamic> jsonSerialization) {
    return Invoice(
      id: jsonSerialization['id'] as int?,
      tenantId: jsonSerialization['tenantId'] as int,
      name: jsonSerialization['name'] as String,
    );
  }

  static final t = InvoiceTable();

  static const db = InvoiceRepository._();

  @override
  int? id;

  String name;

  @override
  _i2.Table get table => t;

  /// Returns a shallow copy of this [Invoice]
  /// with some or all fields replaced by the given arguments.
  @_i2.useResult
  Invoice copyWith({
    int? id,
    int? tenantId,
    String? name,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'tenantId': tenantId,
      'name': name,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'tenantId': tenantId,
      'name': name,
    };
  }

  static InvoiceInclude include() {
    return InvoiceInclude._();
  }

  static InvoiceIncludeList includeList({
    _i2.WhereExpressionBuilder<InvoiceTable>? where,
    int? limit,
    int? offset,
    _i2.OrderByBuilder<InvoiceTable>? orderBy,
    bool orderDescending = false,
    _i2.OrderByListBuilder<InvoiceTable>? orderByList,
    InvoiceInclude? include,
  }) {
    return InvoiceIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Invoice.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Invoice.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i2.SerializationManager.encode(this);
  }
}

class _InvoiceImpl extends Invoice {
  _InvoiceImpl({
    int? id,
    required int tenantId,
    required String name,
  }) : super._(
          id: id,
          tenantId: tenantId,
          name: name,
        );

  /// Returns a shallow copy of this [Invoice]
  /// with some or all fields replaced by the given arguments.
  @_i2.useResult
  @override
  Invoice copyWith({
    Object? id = _Undefined,
    int? tenantId,
    String? name,
  }) {
    return Invoice(
      id: id is int? ? id : this.id,
      tenantId: tenantId ?? this.tenantId,
      name: name ?? this.name,
    );
  }
}

class InvoiceTable extends _i2.Table {
  InvoiceTable({super.tableRelation}) : super(tableName: 'invoice') {
    tenantId = _i2.ColumnInt(
      'tenantId',
      this,
    );
    name = _i2.ColumnString(
      'name',
      this,
    );
  }

  late final _i2.ColumnInt tenantId;

  late final _i2.ColumnString name;

  @override
  List<_i2.Column> get columns => [
        id,
        tenantId,
        name,
      ];
}

class InvoiceInclude extends _i2.IncludeObject {
  InvoiceInclude._();

  @override
  Map<String, _i2.Include?> get includes => {};

  @override
  _i2.Table get table => Invoice.t;
}

class InvoiceIncludeList extends _i2.IncludeList {
  InvoiceIncludeList._({
    _i2.WhereExpressionBuilder<InvoiceTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Invoice.t);
  }

  @override
  Map<String, _i2.Include?> get includes => include?.includes ?? {};

  @override
  _i2.Table get table => Invoice.t;
}

class InvoiceRepository {
  const InvoiceRepository._();

  /// Returns a list of [Invoice]s matching the given query parameters.
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
  Future<List<Invoice>> find(
    _i2.Session session, {
    _i2.WhereExpressionBuilder<InvoiceTable>? where,
    int? limit,
    int? offset,
    _i2.OrderByBuilder<InvoiceTable>? orderBy,
    bool orderDescending = false,
    _i2.OrderByListBuilder<InvoiceTable>? orderByList,
    _i2.Transaction? transaction,
  }) async {
    return session.db.find<Invoice>(
      where: where?.call(Invoice.t),
      orderBy: orderBy?.call(Invoice.t),
      orderByList: orderByList?.call(Invoice.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Invoice] matching the given query parameters.
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
  Future<Invoice?> findFirstRow(
    _i2.Session session, {
    _i2.WhereExpressionBuilder<InvoiceTable>? where,
    int? offset,
    _i2.OrderByBuilder<InvoiceTable>? orderBy,
    bool orderDescending = false,
    _i2.OrderByListBuilder<InvoiceTable>? orderByList,
    _i2.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Invoice>(
      where: where?.call(Invoice.t),
      orderBy: orderBy?.call(Invoice.t),
      orderByList: orderByList?.call(Invoice.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Invoice] by its [id] or null if no such row exists.
  Future<Invoice?> findById(
    _i2.Session session,
    int id, {
    _i2.Transaction? transaction,
  }) async {
    return session.db.findById<Invoice>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Invoice]s in the list and returns the inserted rows.
  ///
  /// The returned [Invoice]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Invoice>> insert(
    _i2.Session session,
    List<Invoice> rows, {
    _i2.Transaction? transaction,
  }) async {
    return session.db.insert<Invoice>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Invoice] and returns the inserted row.
  ///
  /// The returned [Invoice] will have its `id` field set.
  Future<Invoice> insertRow(
    _i2.Session session,
    Invoice row, {
    _i2.Transaction? transaction,
  }) async {
    return session.db.insertRow<Invoice>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Invoice]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Invoice>> update(
    _i2.Session session,
    List<Invoice> rows, {
    _i2.ColumnSelections<InvoiceTable>? columns,
    _i2.Transaction? transaction,
  }) async {
    return session.db.update<Invoice>(
      rows,
      columns: columns?.call(Invoice.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Invoice]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Invoice> updateRow(
    _i2.Session session,
    Invoice row, {
    _i2.ColumnSelections<InvoiceTable>? columns,
    _i2.Transaction? transaction,
  }) async {
    return session.db.updateRow<Invoice>(
      row,
      columns: columns?.call(Invoice.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Invoice]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Invoice>> delete(
    _i2.Session session,
    List<Invoice> rows, {
    _i2.Transaction? transaction,
  }) async {
    return session.db.delete<Invoice>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Invoice].
  Future<Invoice> deleteRow(
    _i2.Session session,
    Invoice row, {
    _i2.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Invoice>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Invoice>> deleteWhere(
    _i2.Session session, {
    required _i2.WhereExpressionBuilder<InvoiceTable> where,
    _i2.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Invoice>(
      where: where(Invoice.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i2.Session session, {
    _i2.WhereExpressionBuilder<InvoiceTable>? where,
    int? limit,
    _i2.Transaction? transaction,
  }) async {
    return session.db.count<Invoice>(
      where: where?.call(Invoice.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
