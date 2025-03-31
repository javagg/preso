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
import 'address.dart' as _i2;
import 'card.dart' as _i3;
import 'serving.dart' as _i4;
import 'membership.dart' as _i5;

abstract class Store implements _i1.SerializableModel {
  Store._({
    this.id,
    required this.tenantId,
    required this.name,
    required this.addressId,
    this.address,
    required this.city,
    required this.province,
    required this.longitude,
    required this.area,
    required this.businessHours,
    required this.latitude,
    required this.tags,
    required this.equipment,
    this.cards,
    required this.services,
    required this.facilities,
    required this.equipments,
    this.serving,
    required this.wifi,
    this.membership,
  });

  factory Store({
    int? id,
    required int tenantId,
    required String name,
    required int addressId,
    _i2.Address? address,
    required String city,
    required String province,
    required double longitude,
    required int area,
    required String businessHours,
    required double latitude,
    required String tags,
    required String equipment,
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
      addressId: jsonSerialization['addressId'] as int,
      address: jsonSerialization['address'] == null
          ? null
          : _i2.Address.fromJson(
              (jsonSerialization['address'] as Map<String, dynamic>)),
      city: jsonSerialization['city'] as String,
      province: jsonSerialization['province'] as String,
      longitude: (jsonSerialization['longitude'] as num).toDouble(),
      area: jsonSerialization['area'] as int,
      businessHours: jsonSerialization['businessHours'] as String,
      latitude: (jsonSerialization['latitude'] as num).toDouble(),
      tags: jsonSerialization['tags'] as String,
      equipment: jsonSerialization['equipment'] as String,
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int tenantId;

  String name;

  int addressId;

  _i2.Address? address;

  String city;

  String province;

  double longitude;

  int area;

  String businessHours;

  double latitude;

  String tags;

  String equipment;

  List<_i3.Card>? cards;

  String services;

  String facilities;

  String equipments;

  List<_i4.Serving>? serving;

  String wifi;

  List<_i5.Membership>? membership;

  /// Returns a shallow copy of this [Store]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Store copyWith({
    int? id,
    int? tenantId,
    String? name,
    int? addressId,
    _i2.Address? address,
    String? city,
    String? province,
    double? longitude,
    int? area,
    String? businessHours,
    double? latitude,
    String? tags,
    String? equipment,
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
      'addressId': addressId,
      if (address != null) 'address': address?.toJson(),
      'city': city,
      'province': province,
      'longitude': longitude,
      'area': area,
      'businessHours': businessHours,
      'latitude': latitude,
      'tags': tags,
      'equipment': equipment,
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
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StoreImpl extends Store {
  _StoreImpl({
    int? id,
    required int tenantId,
    required String name,
    required int addressId,
    _i2.Address? address,
    required String city,
    required String province,
    required double longitude,
    required int area,
    required String businessHours,
    required double latitude,
    required String tags,
    required String equipment,
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
          addressId: addressId,
          address: address,
          city: city,
          province: province,
          longitude: longitude,
          area: area,
          businessHours: businessHours,
          latitude: latitude,
          tags: tags,
          equipment: equipment,
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
    int? addressId,
    Object? address = _Undefined,
    String? city,
    String? province,
    double? longitude,
    int? area,
    String? businessHours,
    double? latitude,
    String? tags,
    String? equipment,
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
      addressId: addressId ?? this.addressId,
      address: address is _i2.Address? ? address : this.address?.copyWith(),
      city: city ?? this.city,
      province: province ?? this.province,
      longitude: longitude ?? this.longitude,
      area: area ?? this.area,
      businessHours: businessHours ?? this.businessHours,
      latitude: latitude ?? this.latitude,
      tags: tags ?? this.tags,
      equipment: equipment ?? this.equipment,
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
