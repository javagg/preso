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

abstract class Bargain implements _i1.SerializableModel {
  Bargain._({
    this.id,
    required this.name,
  });

  factory Bargain({
    int? id,
    required String name,
  }) = _BargainImpl;

  factory Bargain.fromJson(Map<String, dynamic> jsonSerialization) {
    return Bargain(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  /// Returns a shallow copy of this [Bargain]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Bargain copyWith({
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
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BargainImpl extends Bargain {
  _BargainImpl({
    int? id,
    required String name,
  }) : super._(
          id: id,
          name: name,
        );

  /// Returns a shallow copy of this [Bargain]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Bargain copyWith({
    Object? id = _Undefined,
    String? name,
  }) {
    return Bargain(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
    );
  }
}
