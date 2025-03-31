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
import 'trade/card_type.dart' as _i2;

abstract class Card implements _i1.SerializableModel {
  Card._({
    this.id,
    required this.tenantId,
    required this.name,
    required this.description,
    required this.price,
    required this.coverImage,
    required this.duration,
    this.type,
  });

  factory Card({
    int? id,
    required int tenantId,
    required String name,
    required String description,
    required double price,
    required String coverImage,
    required int duration,
    _i2.CardType? type,
  }) = _CardImpl;

  factory Card.fromJson(Map<String, dynamic> jsonSerialization) {
    return Card(
      id: jsonSerialization['id'] as int?,
      tenantId: jsonSerialization['tenantId'] as int,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      price: (jsonSerialization['price'] as num).toDouble(),
      coverImage: jsonSerialization['coverImage'] as String,
      duration: jsonSerialization['duration'] as int,
      type: jsonSerialization['type'] == null
          ? null
          : _i2.CardType.fromJson((jsonSerialization['type'] as String)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int tenantId;

  String name;

  String description;

  double price;

  String coverImage;

  int duration;

  _i2.CardType? type;

  /// Returns a shallow copy of this [Card]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Card copyWith({
    int? id,
    int? tenantId,
    String? name,
    String? description,
    double? price,
    String? coverImage,
    int? duration,
    _i2.CardType? type,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'tenantId': tenantId,
      'name': name,
      'description': description,
      'price': price,
      'coverImage': coverImage,
      'duration': duration,
      if (type != null) 'type': type?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CardImpl extends Card {
  _CardImpl({
    int? id,
    required int tenantId,
    required String name,
    required String description,
    required double price,
    required String coverImage,
    required int duration,
    _i2.CardType? type,
  }) : super._(
          id: id,
          tenantId: tenantId,
          name: name,
          description: description,
          price: price,
          coverImage: coverImage,
          duration: duration,
          type: type,
        );

  /// Returns a shallow copy of this [Card]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Card copyWith({
    Object? id = _Undefined,
    int? tenantId,
    String? name,
    String? description,
    double? price,
    String? coverImage,
    int? duration,
    Object? type = _Undefined,
  }) {
    return Card(
      id: id is int? ? id : this.id,
      tenantId: tenantId ?? this.tenantId,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      coverImage: coverImage ?? this.coverImage,
      duration: duration ?? this.duration,
      type: type is _i2.CardType? ? type : this.type,
    );
  }
}
