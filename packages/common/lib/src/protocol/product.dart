/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'store.dart' as _i2;

abstract class Product implements _i1.SerializableModel {
  Product._({
    this.id,
    required this.tenantId,
    required this.name,
    required this.description,
    bool? offShelf,
    required this.price,
    required this.storeId,
    this.store,
    bool? applicableToAllStores,
  })  : offShelf = offShelf ?? true,
        applicableToAllStores = applicableToAllStores ?? false;

  factory Product({
    int? id,
    required int tenantId,
    required String name,
    required String description,
    bool? offShelf,
    required double price,
    required int storeId,
    _i2.Store? store,
    bool? applicableToAllStores,
  }) = _ProductImpl;

  factory Product.fromJson(Map<String, dynamic> jsonSerialization) {
    return Product(
      id: jsonSerialization['id'] as int?,
      tenantId: jsonSerialization['tenantId'] as int,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      offShelf: jsonSerialization['offShelf'] as bool,
      price: (jsonSerialization['price'] as num).toDouble(),
      storeId: jsonSerialization['storeId'] as int,
      store: jsonSerialization['store'] == null
          ? null
          : _i2.Store.fromJson(
              (jsonSerialization['store'] as Map<String, dynamic>)),
      applicableToAllStores: jsonSerialization['applicableToAllStores'] as bool,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int tenantId;

  String name;

  String description;

  bool offShelf;

  double price;

  int storeId;

  _i2.Store? store;

  bool applicableToAllStores;

  /// Returns a shallow copy of this [Product]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Product copyWith({
    int? id,
    int? tenantId,
    String? name,
    String? description,
    bool? offShelf,
    double? price,
    int? storeId,
    _i2.Store? store,
    bool? applicableToAllStores,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'tenantId': tenantId,
      'name': name,
      'description': description,
      'offShelf': offShelf,
      'price': price,
      'storeId': storeId,
      if (store != null) 'store': store?.toJson(),
      'applicableToAllStores': applicableToAllStores,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProductImpl extends Product {
  _ProductImpl({
    int? id,
    required int tenantId,
    required String name,
    required String description,
    bool? offShelf,
    required double price,
    required int storeId,
    _i2.Store? store,
    bool? applicableToAllStores,
  }) : super._(
          id: id,
          tenantId: tenantId,
          name: name,
          description: description,
          offShelf: offShelf,
          price: price,
          storeId: storeId,
          store: store,
          applicableToAllStores: applicableToAllStores,
        );

  /// Returns a shallow copy of this [Product]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Product copyWith({
    Object? id = _Undefined,
    int? tenantId,
    String? name,
    String? description,
    bool? offShelf,
    double? price,
    int? storeId,
    Object? store = _Undefined,
    bool? applicableToAllStores,
  }) {
    return Product(
      id: id is int? ? id : this.id,
      tenantId: tenantId ?? this.tenantId,
      name: name ?? this.name,
      description: description ?? this.description,
      offShelf: offShelf ?? this.offShelf,
      price: price ?? this.price,
      storeId: storeId ?? this.storeId,
      store: store is _i2.Store? ? store : this.store?.copyWith(),
      applicableToAllStores:
          applicableToAllStores ?? this.applicableToAllStores,
    );
  }
}
