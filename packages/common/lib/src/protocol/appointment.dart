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
import 'member.dart' as _i2;
import 'trainer.dart' as _i3;

abstract class Appointment implements _i1.SerializableModel {
  Appointment._({
    this.id,
    required this.memberId,
    this.member,
    required this.trainerId,
    this.trainer,
    required this.startTime,
    required this.endTime,
  });

  factory Appointment({
    int? id,
    required int memberId,
    _i2.Member? member,
    required int trainerId,
    _i3.Trainer? trainer,
    required DateTime startTime,
    required DateTime endTime,
  }) = _AppointmentImpl;

  factory Appointment.fromJson(Map<String, dynamic> jsonSerialization) {
    return Appointment(
      id: jsonSerialization['id'] as int?,
      memberId: jsonSerialization['memberId'] as int,
      member: jsonSerialization['member'] == null
          ? null
          : _i2.Member.fromJson(
              (jsonSerialization['member'] as Map<String, dynamic>)),
      trainerId: jsonSerialization['trainerId'] as int,
      trainer: jsonSerialization['trainer'] == null
          ? null
          : _i3.Trainer.fromJson(
              (jsonSerialization['trainer'] as Map<String, dynamic>)),
      startTime:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['startTime']),
      endTime: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['endTime']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int memberId;

  _i2.Member? member;

  int trainerId;

  _i3.Trainer? trainer;

  DateTime startTime;

  DateTime endTime;

  /// Returns a shallow copy of this [Appointment]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Appointment copyWith({
    int? id,
    int? memberId,
    _i2.Member? member,
    int? trainerId,
    _i3.Trainer? trainer,
    DateTime? startTime,
    DateTime? endTime,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'memberId': memberId,
      if (member != null) 'member': member?.toJson(),
      'trainerId': trainerId,
      if (trainer != null) 'trainer': trainer?.toJson(),
      'startTime': startTime.toJson(),
      'endTime': endTime.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AppointmentImpl extends Appointment {
  _AppointmentImpl({
    int? id,
    required int memberId,
    _i2.Member? member,
    required int trainerId,
    _i3.Trainer? trainer,
    required DateTime startTime,
    required DateTime endTime,
  }) : super._(
          id: id,
          memberId: memberId,
          member: member,
          trainerId: trainerId,
          trainer: trainer,
          startTime: startTime,
          endTime: endTime,
        );

  /// Returns a shallow copy of this [Appointment]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Appointment copyWith({
    Object? id = _Undefined,
    int? memberId,
    Object? member = _Undefined,
    int? trainerId,
    Object? trainer = _Undefined,
    DateTime? startTime,
    DateTime? endTime,
  }) {
    return Appointment(
      id: id is int? ? id : this.id,
      memberId: memberId ?? this.memberId,
      member: member is _i2.Member? ? member : this.member?.copyWith(),
      trainerId: trainerId ?? this.trainerId,
      trainer: trainer is _i3.Trainer? ? trainer : this.trainer?.copyWith(),
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }
}
