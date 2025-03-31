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
import 'appointment.dart' as _i2;
import 'membership.dart' as _i3;

abstract class Member implements _i1.SerializableModel {
  Member._({
    this.id,
    required this.name,
    required this.gender,
    required this.age,
    required this.mobile,
    bool? suspended,
    required this.headshot,
    required this.face,
    this.appointments,
    this.membership,
  }) : suspended = suspended ?? false;

  factory Member({
    int? id,
    required String name,
    required String gender,
    required int age,
    required String mobile,
    bool? suspended,
    required String headshot,
    required String face,
    List<_i2.Appointment>? appointments,
    List<_i3.Membership>? membership,
  }) = _MemberImpl;

  factory Member.fromJson(Map<String, dynamic> jsonSerialization) {
    return Member(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      gender: jsonSerialization['gender'] as String,
      age: jsonSerialization['age'] as int,
      mobile: jsonSerialization['mobile'] as String,
      suspended: jsonSerialization['suspended'] as bool,
      headshot: jsonSerialization['headshot'] as String,
      face: jsonSerialization['face'] as String,
      appointments: (jsonSerialization['appointments'] as List?)
          ?.map((e) => _i2.Appointment.fromJson((e as Map<String, dynamic>)))
          .toList(),
      membership: (jsonSerialization['membership'] as List?)
          ?.map((e) => _i3.Membership.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String gender;

  int age;

  String mobile;

  bool suspended;

  String headshot;

  String face;

  List<_i2.Appointment>? appointments;

  List<_i3.Membership>? membership;

  /// Returns a shallow copy of this [Member]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Member copyWith({
    int? id,
    String? name,
    String? gender,
    int? age,
    String? mobile,
    bool? suspended,
    String? headshot,
    String? face,
    List<_i2.Appointment>? appointments,
    List<_i3.Membership>? membership,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'gender': gender,
      'age': age,
      'mobile': mobile,
      'suspended': suspended,
      'headshot': headshot,
      'face': face,
      if (appointments != null)
        'appointments': appointments?.toJson(valueToJson: (v) => v.toJson()),
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

class _MemberImpl extends Member {
  _MemberImpl({
    int? id,
    required String name,
    required String gender,
    required int age,
    required String mobile,
    bool? suspended,
    required String headshot,
    required String face,
    List<_i2.Appointment>? appointments,
    List<_i3.Membership>? membership,
  }) : super._(
          id: id,
          name: name,
          gender: gender,
          age: age,
          mobile: mobile,
          suspended: suspended,
          headshot: headshot,
          face: face,
          appointments: appointments,
          membership: membership,
        );

  /// Returns a shallow copy of this [Member]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Member copyWith({
    Object? id = _Undefined,
    String? name,
    String? gender,
    int? age,
    String? mobile,
    bool? suspended,
    String? headshot,
    String? face,
    Object? appointments = _Undefined,
    Object? membership = _Undefined,
  }) {
    return Member(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      mobile: mobile ?? this.mobile,
      suspended: suspended ?? this.suspended,
      headshot: headshot ?? this.headshot,
      face: face ?? this.face,
      appointments: appointments is List<_i2.Appointment>?
          ? appointments
          : this.appointments?.map((e0) => e0.copyWith()).toList(),
      membership: membership is List<_i3.Membership>?
          ? membership
          : this.membership?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
