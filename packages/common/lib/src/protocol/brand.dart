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

abstract class Brand implements _i1.SerializableModel {
  Brand._({
    this.id,
    required this.name,
    required this.logo,
    required this.description,
    required this.website,
  });

  factory Brand({
    int? id,
    required String name,
    required String logo,
    required String description,
    required String website,
  }) = _BrandImpl;

  factory Brand.fromJson(Map<String, dynamic> jsonSerialization) {
    return Brand(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      logo: jsonSerialization['logo'] as String,
      description: jsonSerialization['description'] as String,
      website: jsonSerialization['website'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String logo;

  String description;

  String website;

  /// Returns a shallow copy of this [Brand]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Brand copyWith({
    int? id,
    String? name,
    String? logo,
    String? description,
    String? website,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'logo': logo,
      'description': description,
      'website': website,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BrandImpl extends Brand {
  _BrandImpl({
    int? id,
    required String name,
    required String logo,
    required String description,
    required String website,
  }) : super._(
          id: id,
          name: name,
          logo: logo,
          description: description,
          website: website,
        );

  /// Returns a shallow copy of this [Brand]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Brand copyWith({
    Object? id = _Undefined,
    String? name,
    String? logo,
    String? description,
    String? website,
  }) {
    return Brand(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      logo: logo ?? this.logo,
      description: description ?? this.description,
      website: website ?? this.website,
    );
  }
}
