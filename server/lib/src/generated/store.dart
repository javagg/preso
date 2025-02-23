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
import 'address.dart' as _i2;

abstract class Store implements _i1.TableRow, _i1.ProtocolSerialization {
  Store._({
    this.id,
    required this.name,
    required this.addressId,
    this.address,
  });

  factory Store({
    int? id,
    required String name,
    required int addressId,
    _i2.Address? address,
  }) = _StoreImpl;

  factory Store.fromJson(Map<String, dynamic> jsonSerialization) {
    return Store(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      addressId: jsonSerialization['addressId'] as int,
      address: jsonSerialization['address'] == null
          ? null
          : _i2.Address.fromJson(
              (jsonSerialization['address'] as Map<String, dynamic>)),
    );
  }

  static final t = StoreTable();

  static const db = StoreRepository._();

  @override
  int? id;

  String name;

  int addressId;

  _i2.Address? address;

  @override
  _i1.Table get table => t;

  Store copyWith({
    int? id,
    String? name,
    int? addressId,
    _i2.Address? address,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'addressId': addressId,
      if (address != null) 'address': address?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'addressId': addressId,
      if (address != null) 'address': address?.toJsonForProtocol(),
    };
  }

  static StoreInclude include({_i2.AddressInclude? address}) {
    return StoreInclude._(address: address);
  }

  static StoreIncludeList includeList({
    _i1.WhereExpressionBuilder<StoreTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StoreTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StoreTable>? orderByList,
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
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StoreImpl extends Store {
  _StoreImpl({
    int? id,
    required String name,
    required int addressId,
    _i2.Address? address,
  }) : super._(
          id: id,
          name: name,
          addressId: addressId,
          address: address,
        );

  @override
  Store copyWith({
    Object? id = _Undefined,
    String? name,
    int? addressId,
    Object? address = _Undefined,
  }) {
    return Store(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      addressId: addressId ?? this.addressId,
      address: address is _i2.Address? ? address : this.address?.copyWith(),
    );
  }
}

class StoreTable extends _i1.Table {
  StoreTable({super.tableRelation}) : super(tableName: 'store') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    addressId = _i1.ColumnInt(
      'addressId',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnInt addressId;

  _i2.AddressTable? _address;

  _i2.AddressTable get address {
    if (_address != null) return _address!;
    _address = _i1.createRelationTable(
      relationFieldName: 'address',
      field: Store.t.addressId,
      foreignField: _i2.Address.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.AddressTable(tableRelation: foreignTableRelation),
    );
    return _address!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        addressId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'address') {
      return address;
    }
    return null;
  }
}

class StoreInclude extends _i1.IncludeObject {
  StoreInclude._({_i2.AddressInclude? address}) {
    _address = address;
  }

  _i2.AddressInclude? _address;

  @override
  Map<String, _i1.Include?> get includes => {'address': _address};

  @override
  _i1.Table get table => Store.t;
}

class StoreIncludeList extends _i1.IncludeList {
  StoreIncludeList._({
    _i1.WhereExpressionBuilder<StoreTable>? where,
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
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Store.t;
}

class StoreRepository {
  const StoreRepository._();

  final attachRow = const StoreAttachRowRepository._();

  Future<List<Store>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<StoreTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StoreTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StoreTable>? orderByList,
    _i1.Transaction? transaction,
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

  Future<Store?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<StoreTable>? where,
    int? offset,
    _i1.OrderByBuilder<StoreTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StoreTable>? orderByList,
    _i1.Transaction? transaction,
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

  Future<Store?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    StoreInclude? include,
  }) async {
    return session.db.findById<Store>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Store>> insert(
    _i1.Session session,
    List<Store> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Store>(
      rows,
      transaction: transaction,
    );
  }

  Future<Store> insertRow(
    _i1.Session session,
    Store row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Store>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Store>> update(
    _i1.Session session,
    List<Store> rows, {
    _i1.ColumnSelections<StoreTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Store>(
      rows,
      columns: columns?.call(Store.t),
      transaction: transaction,
    );
  }

  Future<Store> updateRow(
    _i1.Session session,
    Store row, {
    _i1.ColumnSelections<StoreTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Store>(
      row,
      columns: columns?.call(Store.t),
      transaction: transaction,
    );
  }

  Future<List<Store>> delete(
    _i1.Session session,
    List<Store> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Store>(
      rows,
      transaction: transaction,
    );
  }

  Future<Store> deleteRow(
    _i1.Session session,
    Store row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Store>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Store>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<StoreTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Store>(
      where: where(Store.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<StoreTable>? where,
    int? limit,
    _i1.Transaction? transaction,
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

  Future<void> address(
    _i1.Session session,
    Store store,
    _i2.Address address, {
    _i1.Transaction? transaction,
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
