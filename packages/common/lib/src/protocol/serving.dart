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
import 'trainer.dart' as _i2;
import 'store.dart' as _i3;

abstract class Serving implements _i1.SerializableModel {
  Serving._({
    this.id,
    required this.trainerId,
    this.trainer,
    required this.storeId,
    this.store,
  });

  factory Serving({
    int? id,
    required int trainerId,
    _i2.Trainer? trainer,
    required int storeId,
    _i3.Store? store,
  }) = _ServingImpl;

  factory Serving.fromJson(Map<String, dynamic> jsonSerialization) {
    return Serving(
      id: jsonSerialization['id'] as int?,
      trainerId: jsonSerialization['trainerId'] as int,
      trainer: jsonSerialization['trainer'] == null
          ? null
          : _i2.Trainer.fromJson(
              (jsonSerialization['trainer'] as Map<String, dynamic>)),
      storeId: jsonSerialization['storeId'] as int,
      store: jsonSerialization['store'] == null
          ? null
          : _i3.Store.fromJson(
              (jsonSerialization['store'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int trainerId;

  _i2.Trainer? trainer;

  int storeId;

  _i3.Store? store;

  /// Returns a shallow copy of this [Serving]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Serving copyWith({
    int? id,
    int? trainerId,
    _i2.Trainer? trainer,
    int? storeId,
    _i3.Store? store,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'trainerId': trainerId,
      if (trainer != null) 'trainer': trainer?.toJson(),
      'storeId': storeId,
      if (store != null) 'store': store?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ServingImpl extends Serving {
  _ServingImpl({
    int? id,
    required int trainerId,
    _i2.Trainer? trainer,
    required int storeId,
    _i3.Store? store,
  }) : super._(
          id: id,
          trainerId: trainerId,
          trainer: trainer,
          storeId: storeId,
          store: store,
        );

  /// Returns a shallow copy of this [Serving]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Serving copyWith({
    Object? id = _Undefined,
    int? trainerId,
    Object? trainer = _Undefined,
    int? storeId,
    Object? store = _Undefined,
  }) {
    return Serving(
      id: id is int? ? id : this.id,
      trainerId: trainerId ?? this.trainerId,
      trainer: trainer is _i2.Trainer? ? trainer : this.trainer?.copyWith(),
      storeId: storeId ?? this.storeId,
      store: store is _i3.Store? ? store : this.store?.copyWith(),
    );
  }
}
