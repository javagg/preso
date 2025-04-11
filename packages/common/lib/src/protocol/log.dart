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
import 'op_type.dart' as _i3;

abstract class Log implements _i1.SerializableModel {
  Log._({
    this.id,
    required this.tenantId,
    required this.operationTime,
    required this.createrId,
    this.creater,
    required this.type,
    required this.operatee,
  });

  factory Log({
    int? id,
    required int tenantId,
    required DateTime operationTime,
    required int createrId,
    _i2.User? creater,
    required _i3.OpType type,
    required String operatee,
  }) = _LogImpl;

  factory Log.fromJson(Map<String, dynamic> jsonSerialization) {
    return Log(
      id: jsonSerialization['id'] as int?,
      tenantId: jsonSerialization['tenantId'] as int,
      operationTime: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['operationTime']),
      createrId: jsonSerialization['createrId'] as int,
      creater: jsonSerialization['creater'] == null
          ? null
          : _i2.User.fromJson(
              (jsonSerialization['creater'] as Map<String, dynamic>)),
      type: _i3.OpType.fromJson((jsonSerialization['type'] as String)),
      operatee: jsonSerialization['operatee'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int tenantId;

  DateTime operationTime;

  int createrId;

  _i2.User? creater;

  _i3.OpType type;

  String operatee;

  /// Returns a shallow copy of this [Log]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Log copyWith({
    int? id,
    int? tenantId,
    DateTime? operationTime,
    int? createrId,
    _i2.User? creater,
    _i3.OpType? type,
    String? operatee,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'tenantId': tenantId,
      'operationTime': operationTime.toJson(),
      'createrId': createrId,
      if (creater != null) 'creater': creater?.toJson(),
      'type': type.toJson(),
      'operatee': operatee,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LogImpl extends Log {
  _LogImpl({
    int? id,
    required int tenantId,
    required DateTime operationTime,
    required int createrId,
    _i2.User? creater,
    required _i3.OpType type,
    required String operatee,
  }) : super._(
          id: id,
          tenantId: tenantId,
          operationTime: operationTime,
          createrId: createrId,
          creater: creater,
          type: type,
          operatee: operatee,
        );

  /// Returns a shallow copy of this [Log]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Log copyWith({
    Object? id = _Undefined,
    int? tenantId,
    DateTime? operationTime,
    int? createrId,
    Object? creater = _Undefined,
    _i3.OpType? type,
    String? operatee,
  }) {
    return Log(
      id: id is int? ? id : this.id,
      tenantId: tenantId ?? this.tenantId,
      operationTime: operationTime ?? this.operationTime,
      createrId: createrId ?? this.createrId,
      creater: creater is _i2.User? ? creater : this.creater?.copyWith(),
      type: type ?? this.type,
      operatee: operatee ?? this.operatee,
    );
  }
}
