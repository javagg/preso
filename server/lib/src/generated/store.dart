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
import 'card.dart' as _i3;
import 'serving.dart' as _i4;
import 'membership.dart' as _i5;

abstract class Store implements _i1.TableRow<int>, _i1.ProtocolSerialization {
  Store._({
    this.id,
    int? tenantId,
    required this.name,
    String? description,
    required this.addressId,
    this.address,
    required this.longitude,
    required this.area,
    required this.businessHours,
    required this.latitude,
    required this.tags,
    this.cards,
    required this.services,
    required this.facilities,
    required this.equipments,
    this.serving,
    required this.wifi,
    this.membership,
  })  : tenantId = tenantId ?? 1,
        description = description ?? '';

  factory Store({
    int? id,
    int? tenantId,
    required String name,
    String? description,
    required int addressId,
    _i2.Address? address,
    required double longitude,
    required int area,
    required String businessHours,
    required double latitude,
    required String tags,
    List<_i3.Card>? cards,
    required String services,
    required String facilities,
    required String equipments,
    List<_i4.Serving>? serving,
    required String wifi,
    List<_i5.Membership>? membership,
  }) = _StoreImpl;

  factory Store.fromJson(Map<String, dynamic> jsonSerialization) {
    return Store(
      id: jsonSerialization['id'] as int?,
      tenantId: jsonSerialization['tenantId'] as int,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      addressId: jsonSerialization['addressId'] as int,
      address: jsonSerialization['address'] == null
          ? null
          : _i2.Address.fromJson(
              (jsonSerialization['address'] as Map<String, dynamic>)),
      longitude: (jsonSerialization['longitude'] as num).toDouble(),
      area: jsonSerialization['area'] as int,
      businessHours: jsonSerialization['businessHours'] as String,
      latitude: (jsonSerialization['latitude'] as num).toDouble(),
      tags: jsonSerialization['tags'] as String,
      cards: (jsonSerialization['cards'] as List?)
          ?.map((e) => _i3.Card.fromJson((e as Map<String, dynamic>)))
          .toList(),
      services: jsonSerialization['services'] as String,
      facilities: jsonSerialization['facilities'] as String,
      equipments: jsonSerialization['equipments'] as String,
      serving: (jsonSerialization['serving'] as List?)
          ?.map((e) => _i4.Serving.fromJson((e as Map<String, dynamic>)))
          .toList(),
      wifi: jsonSerialization['wifi'] as String,
      membership: (jsonSerialization['membership'] as List?)
          ?.map((e) => _i5.Membership.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  static final t = StoreTable();

  static const db = StoreRepository._();

  @override
  int? id;

  int tenantId;

  String name;

  String description;

  int addressId;

  _i2.Address? address;

  double longitude;

  int area;

  String businessHours;

  double latitude;

  String tags;

  List<_i3.Card>? cards;

  String services;

  String facilities;

  String equipments;

  List<_i4.Serving>? serving;

  String wifi;

  List<_i5.Membership>? membership;

  @override
  _i1.Table<int> get table => t;

  /// Returns a shallow copy of this [Store]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Store copyWith({
    int? id,
    int? tenantId,
    String? name,
    String? description,
    int? addressId,
    _i2.Address? address,
    double? longitude,
    int? area,
    String? businessHours,
    double? latitude,
    String? tags,
    List<_i3.Card>? cards,
    String? services,
    String? facilities,
    String? equipments,
    List<_i4.Serving>? serving,
    String? wifi,
    List<_i5.Membership>? membership,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'tenantId': tenantId,
      'name': name,
      'description': description,
      'addressId': addressId,
      if (address != null) 'address': address?.toJson(),
      'longitude': longitude,
      'area': area,
      'businessHours': businessHours,
      'latitude': latitude,
      'tags': tags,
      if (cards != null) 'cards': cards?.toJson(valueToJson: (v) => v.toJson()),
      'services': services,
      'facilities': facilities,
      'equipments': equipments,
      if (serving != null)
        'serving': serving?.toJson(valueToJson: (v) => v.toJson()),
      'wifi': wifi,
      if (membership != null)
        'membership': membership?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'tenantId': tenantId,
      'name': name,
      'description': description,
      'addressId': addressId,
      if (address != null) 'address': address?.toJsonForProtocol(),
      'longitude': longitude,
      'area': area,
      'businessHours': businessHours,
      'latitude': latitude,
      'tags': tags,
      if (cards != null)
        'cards': cards?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'services': services,
      'facilities': facilities,
      'equipments': equipments,
      if (serving != null)
        'serving': serving?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'wifi': wifi,
      if (membership != null)
        'membership':
            membership?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static StoreInclude include({
    _i2.AddressInclude? address,
    _i3.CardIncludeList? cards,
    _i4.ServingIncludeList? serving,
    _i5.MembershipIncludeList? membership,
  }) {
    return StoreInclude._(
      address: address,
      cards: cards,
      serving: serving,
      membership: membership,
    );
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
    int? tenantId,
    required String name,
    String? description,
    required int addressId,
    _i2.Address? address,
    required double longitude,
    required int area,
    required String businessHours,
    required double latitude,
    required String tags,
    List<_i3.Card>? cards,
    required String services,
    required String facilities,
    required String equipments,
    List<_i4.Serving>? serving,
    required String wifi,
    List<_i5.Membership>? membership,
  }) : super._(
          id: id,
          tenantId: tenantId,
          name: name,
          description: description,
          addressId: addressId,
          address: address,
          longitude: longitude,
          area: area,
          businessHours: businessHours,
          latitude: latitude,
          tags: tags,
          cards: cards,
          services: services,
          facilities: facilities,
          equipments: equipments,
          serving: serving,
          wifi: wifi,
          membership: membership,
        );

  /// Returns a shallow copy of this [Store]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Store copyWith({
    Object? id = _Undefined,
    int? tenantId,
    String? name,
    String? description,
    int? addressId,
    Object? address = _Undefined,
    double? longitude,
    int? area,
    String? businessHours,
    double? latitude,
    String? tags,
    Object? cards = _Undefined,
    String? services,
    String? facilities,
    String? equipments,
    Object? serving = _Undefined,
    String? wifi,
    Object? membership = _Undefined,
  }) {
    return Store(
      id: id is int? ? id : this.id,
      tenantId: tenantId ?? this.tenantId,
      name: name ?? this.name,
      description: description ?? this.description,
      addressId: addressId ?? this.addressId,
      address: address is _i2.Address? ? address : this.address?.copyWith(),
      longitude: longitude ?? this.longitude,
      area: area ?? this.area,
      businessHours: businessHours ?? this.businessHours,
      latitude: latitude ?? this.latitude,
      tags: tags ?? this.tags,
      cards: cards is List<_i3.Card>?
          ? cards
          : this.cards?.map((e0) => e0.copyWith()).toList(),
      services: services ?? this.services,
      facilities: facilities ?? this.facilities,
      equipments: equipments ?? this.equipments,
      serving: serving is List<_i4.Serving>?
          ? serving
          : this.serving?.map((e0) => e0.copyWith()).toList(),
      wifi: wifi ?? this.wifi,
      membership: membership is List<_i5.Membership>?
          ? membership
          : this.membership?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class StoreTable extends _i1.Table<int> {
  StoreTable({super.tableRelation}) : super(tableName: 'store') {
    tenantId = _i1.ColumnInt(
      'tenantId',
      this,
      hasDefault: true,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
      hasDefault: true,
    );
    addressId = _i1.ColumnInt(
      'addressId',
      this,
    );
    longitude = _i1.ColumnDouble(
      'longitude',
      this,
    );
    area = _i1.ColumnInt(
      'area',
      this,
    );
    businessHours = _i1.ColumnString(
      'businessHours',
      this,
    );
    latitude = _i1.ColumnDouble(
      'latitude',
      this,
    );
    tags = _i1.ColumnString(
      'tags',
      this,
    );
    services = _i1.ColumnString(
      'services',
      this,
    );
    facilities = _i1.ColumnString(
      'facilities',
      this,
    );
    equipments = _i1.ColumnString(
      'equipments',
      this,
    );
    wifi = _i1.ColumnString(
      'wifi',
      this,
    );
  }

  late final _i1.ColumnInt tenantId;

  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  late final _i1.ColumnInt addressId;

  _i2.AddressTable? _address;

  late final _i1.ColumnDouble longitude;

  late final _i1.ColumnInt area;

  late final _i1.ColumnString businessHours;

  late final _i1.ColumnDouble latitude;

  late final _i1.ColumnString tags;

  _i3.CardTable? ___cards;

  _i1.ManyRelation<_i3.CardTable>? _cards;

  late final _i1.ColumnString services;

  late final _i1.ColumnString facilities;

  late final _i1.ColumnString equipments;

  _i4.ServingTable? ___serving;

  _i1.ManyRelation<_i4.ServingTable>? _serving;

  late final _i1.ColumnString wifi;

  _i5.MembershipTable? ___membership;

  _i1.ManyRelation<_i5.MembershipTable>? _membership;

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

  _i3.CardTable get __cards {
    if (___cards != null) return ___cards!;
    ___cards = _i1.createRelationTable(
      relationFieldName: '__cards',
      field: Store.t.id,
      foreignField: _i3.Card.t.$_storeCardsStoreId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.CardTable(tableRelation: foreignTableRelation),
    );
    return ___cards!;
  }

  _i4.ServingTable get __serving {
    if (___serving != null) return ___serving!;
    ___serving = _i1.createRelationTable(
      relationFieldName: '__serving',
      field: Store.t.id,
      foreignField: _i4.Serving.t.storeId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.ServingTable(tableRelation: foreignTableRelation),
    );
    return ___serving!;
  }

  _i5.MembershipTable get __membership {
    if (___membership != null) return ___membership!;
    ___membership = _i1.createRelationTable(
      relationFieldName: '__membership',
      field: Store.t.id,
      foreignField: _i5.Membership.t.storeId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.MembershipTable(tableRelation: foreignTableRelation),
    );
    return ___membership!;
  }

  _i1.ManyRelation<_i3.CardTable> get cards {
    if (_cards != null) return _cards!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'cards',
      field: Store.t.id,
      foreignField: _i3.Card.t.$_storeCardsStoreId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.CardTable(tableRelation: foreignTableRelation),
    );
    _cards = _i1.ManyRelation<_i3.CardTable>(
      tableWithRelations: relationTable,
      table: _i3.CardTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _cards!;
  }

  _i1.ManyRelation<_i4.ServingTable> get serving {
    if (_serving != null) return _serving!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'serving',
      field: Store.t.id,
      foreignField: _i4.Serving.t.storeId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.ServingTable(tableRelation: foreignTableRelation),
    );
    _serving = _i1.ManyRelation<_i4.ServingTable>(
      tableWithRelations: relationTable,
      table: _i4.ServingTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _serving!;
  }

  _i1.ManyRelation<_i5.MembershipTable> get membership {
    if (_membership != null) return _membership!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'membership',
      field: Store.t.id,
      foreignField: _i5.Membership.t.storeId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.MembershipTable(tableRelation: foreignTableRelation),
    );
    _membership = _i1.ManyRelation<_i5.MembershipTable>(
      tableWithRelations: relationTable,
      table: _i5.MembershipTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _membership!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        tenantId,
        name,
        description,
        addressId,
        longitude,
        area,
        businessHours,
        latitude,
        tags,
        services,
        facilities,
        equipments,
        wifi,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'address') {
      return address;
    }
    if (relationField == 'cards') {
      return __cards;
    }
    if (relationField == 'serving') {
      return __serving;
    }
    if (relationField == 'membership') {
      return __membership;
    }
    return null;
  }
}

class StoreInclude extends _i1.IncludeObject {
  StoreInclude._({
    _i2.AddressInclude? address,
    _i3.CardIncludeList? cards,
    _i4.ServingIncludeList? serving,
    _i5.MembershipIncludeList? membership,
  }) {
    _address = address;
    _cards = cards;
    _serving = serving;
    _membership = membership;
  }

  _i2.AddressInclude? _address;

  _i3.CardIncludeList? _cards;

  _i4.ServingIncludeList? _serving;

  _i5.MembershipIncludeList? _membership;

  @override
  Map<String, _i1.Include?> get includes => {
        'address': _address,
        'cards': _cards,
        'serving': _serving,
        'membership': _membership,
      };

  @override
  _i1.Table<int> get table => Store.t;
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
  _i1.Table<int> get table => Store.t;
}

class StoreRepository {
  const StoreRepository._();

  final attach = const StoreAttachRepository._();

  final attachRow = const StoreAttachRowRepository._();

  final detach = const StoreDetachRepository._();

  final detachRow = const StoreDetachRowRepository._();

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

  /// Finds a single [Store] by its [id] or null if no such row exists.
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

  /// Inserts all [Store]s in the list and returns the inserted rows.
  ///
  /// The returned [Store]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
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

  /// Inserts a single [Store] and returns the inserted row.
  ///
  /// The returned [Store] will have its `id` field set.
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

  /// Updates all [Store]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
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

  /// Updates a single [Store]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
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

  /// Deletes all [Store]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
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

  /// Deletes a single [Store].
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

  /// Deletes all rows matching the [where] expression.
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

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
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

class StoreAttachRepository {
  const StoreAttachRepository._();

  /// Creates a relation between this [Store] and the given [Card]s
  /// by setting each [Card]'s foreign key `_storeCardsStoreId` to refer to this [Store].
  Future<void> cards(
    _i1.Session session,
    Store store,
    List<_i3.Card> card, {
    _i1.Transaction? transaction,
  }) async {
    if (card.any((e) => e.id == null)) {
      throw ArgumentError.notNull('card.id');
    }
    if (store.id == null) {
      throw ArgumentError.notNull('store.id');
    }

    var $card = card
        .map((e) => _i3.CardImplicit(
              e,
              $_storeCardsStoreId: store.id,
            ))
        .toList();
    await session.db.update<_i3.Card>(
      $card,
      columns: [_i3.Card.t.$_storeCardsStoreId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Store] and the given [Serving]s
  /// by setting each [Serving]'s foreign key `storeId` to refer to this [Store].
  Future<void> serving(
    _i1.Session session,
    Store store,
    List<_i4.Serving> serving, {
    _i1.Transaction? transaction,
  }) async {
    if (serving.any((e) => e.id == null)) {
      throw ArgumentError.notNull('serving.id');
    }
    if (store.id == null) {
      throw ArgumentError.notNull('store.id');
    }

    var $serving = serving.map((e) => e.copyWith(storeId: store.id)).toList();
    await session.db.update<_i4.Serving>(
      $serving,
      columns: [_i4.Serving.t.storeId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Store] and the given [Membership]s
  /// by setting each [Membership]'s foreign key `storeId` to refer to this [Store].
  Future<void> membership(
    _i1.Session session,
    Store store,
    List<_i5.Membership> membership, {
    _i1.Transaction? transaction,
  }) async {
    if (membership.any((e) => e.id == null)) {
      throw ArgumentError.notNull('membership.id');
    }
    if (store.id == null) {
      throw ArgumentError.notNull('store.id');
    }

    var $membership =
        membership.map((e) => e.copyWith(storeId: store.id)).toList();
    await session.db.update<_i5.Membership>(
      $membership,
      columns: [_i5.Membership.t.storeId],
      transaction: transaction,
    );
  }
}

class StoreAttachRowRepository {
  const StoreAttachRowRepository._();

  /// Creates a relation between the given [Store] and [Address]
  /// by setting the [Store]'s foreign key `addressId` to refer to the [Address].
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

  /// Creates a relation between this [Store] and the given [Card]
  /// by setting the [Card]'s foreign key `_storeCardsStoreId` to refer to this [Store].
  Future<void> cards(
    _i1.Session session,
    Store store,
    _i3.Card card, {
    _i1.Transaction? transaction,
  }) async {
    if (card.id == null) {
      throw ArgumentError.notNull('card.id');
    }
    if (store.id == null) {
      throw ArgumentError.notNull('store.id');
    }

    var $card = _i3.CardImplicit(
      card,
      $_storeCardsStoreId: store.id,
    );
    await session.db.updateRow<_i3.Card>(
      $card,
      columns: [_i3.Card.t.$_storeCardsStoreId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Store] and the given [Serving]
  /// by setting the [Serving]'s foreign key `storeId` to refer to this [Store].
  Future<void> serving(
    _i1.Session session,
    Store store,
    _i4.Serving serving, {
    _i1.Transaction? transaction,
  }) async {
    if (serving.id == null) {
      throw ArgumentError.notNull('serving.id');
    }
    if (store.id == null) {
      throw ArgumentError.notNull('store.id');
    }

    var $serving = serving.copyWith(storeId: store.id);
    await session.db.updateRow<_i4.Serving>(
      $serving,
      columns: [_i4.Serving.t.storeId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Store] and the given [Membership]
  /// by setting the [Membership]'s foreign key `storeId` to refer to this [Store].
  Future<void> membership(
    _i1.Session session,
    Store store,
    _i5.Membership membership, {
    _i1.Transaction? transaction,
  }) async {
    if (membership.id == null) {
      throw ArgumentError.notNull('membership.id');
    }
    if (store.id == null) {
      throw ArgumentError.notNull('store.id');
    }

    var $membership = membership.copyWith(storeId: store.id);
    await session.db.updateRow<_i5.Membership>(
      $membership,
      columns: [_i5.Membership.t.storeId],
      transaction: transaction,
    );
  }
}

class StoreDetachRepository {
  const StoreDetachRepository._();

  /// Detaches the relation between this [Store] and the given [Card]
  /// by setting the [Card]'s foreign key `_storeCardsStoreId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> cards(
    _i1.Session session,
    List<_i3.Card> card, {
    _i1.Transaction? transaction,
  }) async {
    if (card.any((e) => e.id == null)) {
      throw ArgumentError.notNull('card.id');
    }

    var $card = card
        .map((e) => _i3.CardImplicit(
              e,
              $_storeCardsStoreId: null,
            ))
        .toList();
    await session.db.update<_i3.Card>(
      $card,
      columns: [_i3.Card.t.$_storeCardsStoreId],
      transaction: transaction,
    );
  }
}

class StoreDetachRowRepository {
  const StoreDetachRowRepository._();

  /// Detaches the relation between this [Store] and the given [Card]
  /// by setting the [Card]'s foreign key `_storeCardsStoreId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> cards(
    _i1.Session session,
    _i3.Card card, {
    _i1.Transaction? transaction,
  }) async {
    if (card.id == null) {
      throw ArgumentError.notNull('card.id');
    }

    var $card = _i3.CardImplicit(
      card,
      $_storeCardsStoreId: null,
    );
    await session.db.updateRow<_i3.Card>(
      $card,
      columns: [_i3.Card.t.$_storeCardsStoreId],
      transaction: transaction,
    );
  }
}
