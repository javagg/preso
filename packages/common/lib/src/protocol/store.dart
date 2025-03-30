/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

part of 'tenantable.dart';

abstract class Store extends _i1.Tenantable implements _i2.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  int addressId;

  _i3.Address? address;

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
