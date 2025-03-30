/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

part of 'tenantable.dart';

abstract class Store extends _i1.Tenantable
    implements _i2.TableRow, _i2.ProtocolSerialization {
  Store._({
    this.id,
    required super.tenantId,
    required this.name,
    required this.addressId,
    this.address,
  });

  factory Store({
    int? id,
    required int tenantId,
    required String name,
    required int addressId,
    _i3.Address? address,
  }) = _StoreImpl;

  factory Store.fromJson(Map<String, dynamic> jsonSerialization) {
    return Store(
      id: jsonSerialization['id'] as int?,
      tenantId: jsonSerialization['tenantId'] as int,
      name: jsonSerialization['name'] as String,
      addressId: jsonSerialization['addressId'] as int,
      address: jsonSerialization['address'] == null
          ? null
          : _i3.Address.fromJson(
              (jsonSerialization['address'] as Map<String, dynamic>)),
    );
  }

  static final t = StoreTable();

  static const db = StoreRepository._();

  @override
  int? id;

  String name;

  int addressId;

  _i3.Address? address;

  @override
  _i2.Table get table => t;

  /// Returns a shallow copy of this [Store]
  /// with some or all fields replaced by the given arguments.
  @_i2.useResult
  Store copyWith({
    int? id,
    int? tenantId,
    String? name,
    int? addressId,
    _i3.Address? address,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'tenantId': tenantId,
      'name': name,
      'addressId': addressId,
      if (address != null) 'address': address?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'tenantId': tenantId,
      'name': name,
      'addressId': addressId,
      if (address != null) 'address': address?.toJsonForProtocol(),
    };
  }

  static StoreInclude include({_i3.AddressInclude? address}) {
    return StoreInclude._(address: address);
  }

  static StoreIncludeList includeList({
    _i2.WhereExpressionBuilder<StoreTable>? where,
    int? limit,
    int? offset,
    _i2.OrderByBuilder<StoreTable>? orderBy,
    bool orderDescending = false,
    _i2.OrderByListBuilder<StoreTable>? orderByList,
    StoreInclude? include,
  }) {
    return StoreIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Store.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Store.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i2.SerializationManager.encode(this);
  }
}

class _StoreImpl extends Store {
  _StoreImpl({
    int? id,
    required int tenantId,
    required String name,
    required int addressId,
    _i3.Address? address,
  }) : super._(
          id: id,
          tenantId: tenantId,
          name: name,
          addressId: addressId,
          address: address,
        );

  /// Returns a shallow copy of this [Store]
  /// with some or all fields replaced by the given arguments.
  @_i2.useResult
  @override
  Store copyWith({
    Object? id = _Undefined,
    int? tenantId,
    String? name,
    int? addressId,
    Object? address = _Undefined,
  }) {
    return Store(
      id: id is int? ? id : this.id,
      tenantId: tenantId ?? this.tenantId,
      name: name ?? this.name,
      addressId: addressId ?? this.addressId,
      address: address is _i3.Address? ? address : this.address?.copyWith(),
    );
  }
}

class StoreTable extends _i2.Table {
  StoreTable({super.tableRelation}) : super(tableName: 'store') {
    tenantId = _i2.ColumnInt(
      'tenantId',
      this,
    );
    name = _i2.ColumnString(
      'name',
      this,
    );
    addressId = _i2.ColumnInt(
      'addressId',
      this,
    );
  }

  late final _i2.ColumnInt tenantId;

  late final _i2.ColumnString name;

  late final _i2.ColumnInt addressId;

  _i3.AddressTable? _address;

  _i3.AddressTable get address {
    if (_address != null) return _address!;
    _address = _i2.createRelationTable(
      relationFieldName: 'address',
      field: Store.t.addressId,
      foreignField: _i3.Address.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.AddressTable(tableRelation: foreignTableRelation),
    );
    return _address!;
  }

  @override
  List<_i2.Column> get columns => [
        id,
        tenantId,
        name,
        addressId,
      ];

  @override
  _i2.Table? getRelationTable(String relationField) {
    if (relationField == 'address') {
      return address;
    }
    return null;
  }
}

class StoreInclude extends _i2.IncludeObject {
  StoreInclude._({_i3.AddressInclude? address}) {
    _address = address;
  }

  _i3.AddressInclude? _address;

  @override
  Map<String, _i2.Include?> get includes => {'address': _address};

  @override
  _i2.Table get table => Store.t;
}

class StoreIncludeList extends _i2.IncludeList {
  StoreIncludeList._({
    _i2.WhereExpressionBuilder<StoreTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Store.t);
  }

  @override
  Map<String, _i2.Include?> get includes => include?.includes ?? {};

  @override
  _i2.Table get table => Store.t;
}

class StoreRepository {
  const StoreRepository._();

  final attachRow = const StoreAttachRowRepository._();

  /// Returns a list of [Store]s matching the given query parameters.
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
  Future<List<Store>> find(
    _i2.Session session, {
    _i2.WhereExpressionBuilder<StoreTable>? where,
    int? limit,
    int? offset,
    _i2.OrderByBuilder<StoreTable>? orderBy,
    bool orderDescending = false,
    _i2.OrderByListBuilder<StoreTable>? orderByList,
    _i2.Transaction? transaction,
    StoreInclude? include,
  }) async {
    return session.db.find<Store>(
      where: where?.call(Store.t),
      orderBy: orderBy?.call(Store.t),
      orderByList: orderByList?.call(Store.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Store] matching the given query parameters.
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
  Future<Store?> findFirstRow(
    _i2.Session session, {
    _i2.WhereExpressionBuilder<StoreTable>? where,
    int? offset,
    _i2.OrderByBuilder<StoreTable>? orderBy,
    bool orderDescending = false,
    _i2.OrderByListBuilder<StoreTable>? orderByList,
    _i2.Transaction? transaction,
    StoreInclude? include,
  }) async {
    return session.db.findFirstRow<Store>(
      where: where?.call(Store.t),
      orderBy: orderBy?.call(Store.t),
      orderByList: orderByList?.call(Store.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Store] by its [id] or null if no such row exists.
  Future<Store?> findById(
    _i2.Session session,
    int id, {
    _i2.Transaction? transaction,
    StoreInclude? include,
  }) async {
    return session.db.findById<Store>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Store]s in the list and returns the inserted rows.
  ///
  /// The returned [Store]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Store>> insert(
    _i2.Session session,
    List<Store> rows, {
    _i2.Transaction? transaction,
  }) async {
    return session.db.insert<Store>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Store] and returns the inserted row.
  ///
  /// The returned [Store] will have its `id` field set.
  Future<Store> insertRow(
    _i2.Session session,
    Store row, {
    _i2.Transaction? transaction,
  }) async {
    return session.db.insertRow<Store>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Store]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Store>> update(
    _i2.Session session,
    List<Store> rows, {
    _i2.ColumnSelections<StoreTable>? columns,
    _i2.Transaction? transaction,
  }) async {
    return session.db.update<Store>(
      rows,
      columns: columns?.call(Store.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Store]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Store> updateRow(
    _i2.Session session,
    Store row, {
    _i2.ColumnSelections<StoreTable>? columns,
    _i2.Transaction? transaction,
  }) async {
    return session.db.updateRow<Store>(
      row,
      columns: columns?.call(Store.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Store]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Store>> delete(
    _i2.Session session,
    List<Store> rows, {
    _i2.Transaction? transaction,
  }) async {
    return session.db.delete<Store>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Store].
  Future<Store> deleteRow(
    _i2.Session session,
    Store row, {
    _i2.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Store>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Store>> deleteWhere(
    _i2.Session session, {
    required _i2.WhereExpressionBuilder<StoreTable> where,
    _i2.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Store>(
      where: where(Store.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i2.Session session, {
    _i2.WhereExpressionBuilder<StoreTable>? where,
    int? limit,
    _i2.Transaction? transaction,
  }) async {
    return session.db.count<Store>(
      where: where?.call(Store.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class StoreAttachRowRepository {
  const StoreAttachRowRepository._();

  /// Creates a relation between the given [Store] and [Address]
  /// by setting the [Store]'s foreign key `addressId` to refer to the [Address].
  Future<void> address(
    _i2.Session session,
    Store store,
    _i3.Address address, {
    _i2.Transaction? transaction,
  }) async {
    if (store.id == null) {
      throw ArgumentError.notNull('store.id');
    }
    if (address.id == null) {
      throw ArgumentError.notNull('address.id');
    }

    var $store = store.copyWith(addressId: address.id);
    await session.db.updateRow<Store>(
      $store,
      columns: [Store.t.addressId],
      transaction: transaction,
    );
  }
}
