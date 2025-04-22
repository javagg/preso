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
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i2;
import 'appointment.dart' as _i3;
import 'membership.dart' as _i4;
import 'trainer.dart' as _i5;

abstract class User implements _i1.SerializableModel {
  User._({
    this.id,
    required this.name,
    required this.userInfoId,
    this.userInfo,
    String? gender,
    this.birthday,
    this.mobile,
    bool? suspended,
    this.headshot,
    this.face,
    this.appointments,
    this.membership,
    this.asTrainerId,
    this.asTrainer,
    this.point,
  })  : gender = gender ?? 'male',
        suspended = suspended ?? false;

  factory User({
    int? id,
    required String name,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    String? gender,
    DateTime? birthday,
    String? mobile,
    bool? suspended,
    String? headshot,
    String? face,
    List<_i3.Appointment>? appointments,
    List<_i4.Membership>? membership,
    int? asTrainerId,
    _i5.Trainer? asTrainer,
    String? point,
  }) = _UserImpl;

  factory User.fromJson(Map<String, dynamic> jsonSerialization) {
    return User(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      userInfoId: jsonSerialization['userInfoId'] as int,
      userInfo: jsonSerialization['userInfo'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['userInfo'] as Map<String, dynamic>)),
      gender: jsonSerialization['gender'] as String,
      birthday: jsonSerialization['birthday'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['birthday']),
      mobile: jsonSerialization['mobile'] as String?,
      suspended: jsonSerialization['suspended'] as bool,
      headshot: jsonSerialization['headshot'] as String?,
      face: jsonSerialization['face'] as String?,
      appointments: (jsonSerialization['appointments'] as List?)
          ?.map((e) => _i3.Appointment.fromJson((e as Map<String, dynamic>)))
          .toList(),
      membership: (jsonSerialization['membership'] as List?)
          ?.map((e) => _i4.Membership.fromJson((e as Map<String, dynamic>)))
          .toList(),
      asTrainerId: jsonSerialization['asTrainerId'] as int?,
      asTrainer: jsonSerialization['asTrainer'] == null
          ? null
          : _i5.Trainer.fromJson(
              (jsonSerialization['asTrainer'] as Map<String, dynamic>)),
      point: jsonSerialization['point'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  int userInfoId;

  _i2.UserInfo? userInfo;

  String gender;

  DateTime? birthday;

  String? mobile;

  bool suspended;

  String? headshot;

  String? face;

  List<_i3.Appointment>? appointments;

  List<_i4.Membership>? membership;

  int? asTrainerId;

  _i5.Trainer? asTrainer;

  String? point;

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  User copyWith({
    int? id,
    String? name,
    int? userInfoId,
    _i2.UserInfo? userInfo,
    String? gender,
    DateTime? birthday,
    String? mobile,
    bool? suspended,
    String? headshot,
    String? face,
    List<_i3.Appointment>? appointments,
    List<_i4.Membership>? membership,
    int? asTrainerId,
    _i5.Trainer? asTrainer,
    String? point,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJson(),
      'gender': gender,
      if (birthday != null) 'birthday': birthday?.toJson(),
      if (mobile != null) 'mobile': mobile,
      'suspended': suspended,
      if (headshot != null) 'headshot': headshot,
      if (face != null) 'face': face,
      if (appointments != null)
        'appointments': appointments?.toJson(valueToJson: (v) => v.toJson()),
      if (membership != null)
        'membership': membership?.toJson(valueToJson: (v) => v.toJson()),
      if (asTrainerId != null) 'asTrainerId': asTrainerId,
      if (asTrainer != null) 'asTrainer': asTrainer?.toJson(),
      if (point != null) 'point': point,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserImpl extends User {
  _UserImpl({
    int? id,
    required String name,
    required int userInfoId,
    _i2.UserInfo? userInfo,
    String? gender,
    DateTime? birthday,
    String? mobile,
    bool? suspended,
    String? headshot,
    String? face,
    List<_i3.Appointment>? appointments,
    List<_i4.Membership>? membership,
    int? asTrainerId,
    _i5.Trainer? asTrainer,
    String? point,
  }) : super._(
          id: id,
          name: name,
          userInfoId: userInfoId,
          userInfo: userInfo,
          gender: gender,
          birthday: birthday,
          mobile: mobile,
          suspended: suspended,
          headshot: headshot,
          face: face,
          appointments: appointments,
          membership: membership,
          asTrainerId: asTrainerId,
          asTrainer: asTrainer,
          point: point,
        );

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  User copyWith({
    Object? id = _Undefined,
    String? name,
    int? userInfoId,
    Object? userInfo = _Undefined,
    String? gender,
    Object? birthday = _Undefined,
    Object? mobile = _Undefined,
    bool? suspended,
    Object? headshot = _Undefined,
    Object? face = _Undefined,
    Object? appointments = _Undefined,
    Object? membership = _Undefined,
    Object? asTrainerId = _Undefined,
    Object? asTrainer = _Undefined,
    Object? point = _Undefined,
  }) {
    return User(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      userInfoId: userInfoId ?? this.userInfoId,
      userInfo:
          userInfo is _i2.UserInfo? ? userInfo : this.userInfo?.copyWith(),
      gender: gender ?? this.gender,
      birthday: birthday is DateTime? ? birthday : this.birthday,
      mobile: mobile is String? ? mobile : this.mobile,
      suspended: suspended ?? this.suspended,
      headshot: headshot is String? ? headshot : this.headshot,
      face: face is String? ? face : this.face,
      appointments: appointments is List<_i3.Appointment>?
          ? appointments
          : this.appointments?.map((e0) => e0.copyWith()).toList(),
      membership: membership is List<_i4.Membership>?
          ? membership
          : this.membership?.map((e0) => e0.copyWith()).toList(),
      asTrainerId: asTrainerId is int? ? asTrainerId : this.asTrainerId,
      asTrainer:
          asTrainer is _i5.Trainer? ? asTrainer : this.asTrainer?.copyWith(),
      point: point is String? ? point : this.point,
    );
  }
}
