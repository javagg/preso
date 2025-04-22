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
import 'user.dart' as _i2;
import 'store.dart' as _i3;

abstract class Membership implements _i1.SerializableModel {
  Membership._({
    this.id,
    required this.userId,
    this.user,
    required this.storeId,
    this.store,
    bool? active,
  }) : active = active ?? false;

  factory Membership({
    int? id,
    required int userId,
    _i2.User? user,
    required int storeId,
    _i3.Store? store,
    bool? active,
  }) = _MembershipImpl;

  factory Membership.fromJson(Map<String, dynamic> jsonSerialization) {
    return Membership(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i2.User.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
      storeId: jsonSerialization['storeId'] as int,
      store: jsonSerialization['store'] == null
          ? null
          : _i3.Store.fromJson(
              (jsonSerialization['store'] as Map<String, dynamic>)),
      active: jsonSerialization['active'] as bool,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  _i2.User? user;

  int storeId;

  _i3.Store? store;

  bool active;

  /// Returns a shallow copy of this [Membership]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Membership copyWith({
    int? id,
    int? userId,
    _i2.User? user,
    int? storeId,
    _i3.Store? store,
    bool? active,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      'storeId': storeId,
      if (store != null) 'store': store?.toJson(),
      'active': active,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _MembershipImpl extends Membership {
  _MembershipImpl({
    int? id,
    required int userId,
    _i2.User? user,
    required int storeId,
    _i3.Store? store,
    bool? active,
  }) : super._(
          id: id,
          userId: userId,
          user: user,
          storeId: storeId,
          store: store,
          active: active,
        );

  /// Returns a shallow copy of this [Membership]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Membership copyWith({
    Object? id = _Undefined,
    int? userId,
    Object? user = _Undefined,
    int? storeId,
    Object? store = _Undefined,
    bool? active,
  }) {
    return Membership(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.User? ? user : this.user?.copyWith(),
      storeId: storeId ?? this.storeId,
      store: store is _i3.Store? ? store : this.store?.copyWith(),
      active: active ?? this.active,
    );
  }
}
