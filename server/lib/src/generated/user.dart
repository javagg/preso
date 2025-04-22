/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i2;
import 'appointment.dart' as _i3;
import 'membership.dart' as _i4;
import 'trainer.dart' as _i5;

abstract class User implements _i1.TableRow<int>, _i1.ProtocolSerialization {
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

  static final t = UserTable();

  static const db = UserRepository._();

  @override
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

  @override
  _i1.Table<int> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'userInfoId': userInfoId,
      if (userInfo != null) 'userInfo': userInfo?.toJsonForProtocol(),
      'gender': gender,
      if (birthday != null) 'birthday': birthday?.toJson(),
      if (mobile != null) 'mobile': mobile,
      'suspended': suspended,
      if (headshot != null) 'headshot': headshot,
      if (face != null) 'face': face,
      if (appointments != null)
        'appointments':
            appointments?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (membership != null)
        'membership':
            membership?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (asTrainerId != null) 'asTrainerId': asTrainerId,
      if (asTrainer != null) 'asTrainer': asTrainer?.toJsonForProtocol(),
      if (point != null) 'point': point,
    };
  }

  static UserInclude include({
    _i2.UserInfoInclude? userInfo,
    _i3.AppointmentIncludeList? appointments,
    _i4.MembershipIncludeList? membership,
    _i5.TrainerInclude? asTrainer,
  }) {
    return UserInclude._(
      userInfo: userInfo,
      appointments: appointments,
      membership: membership,
      asTrainer: asTrainer,
    );
  }

  static UserIncludeList includeList({
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    UserInclude? include,
  }) {
    return UserIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(User.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(User.t),
      include: include,
    );
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

class UserTable extends _i1.Table<int> {
  UserTable({super.tableRelation}) : super(tableName: 'user') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
    gender = _i1.ColumnString(
      'gender',
      this,
      hasDefault: true,
    );
    birthday = _i1.ColumnDateTime(
      'birthday',
      this,
    );
    mobile = _i1.ColumnString(
      'mobile',
      this,
    );
    suspended = _i1.ColumnBool(
      'suspended',
      this,
      hasDefault: true,
    );
    headshot = _i1.ColumnString(
      'headshot',
      this,
    );
    face = _i1.ColumnString(
      'face',
      this,
    );
    asTrainerId = _i1.ColumnInt(
      'asTrainerId',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnInt userInfoId;

  _i2.UserInfoTable? _userInfo;

  late final _i1.ColumnString gender;

  late final _i1.ColumnDateTime birthday;

  late final _i1.ColumnString mobile;

  late final _i1.ColumnBool suspended;

  late final _i1.ColumnString headshot;

  late final _i1.ColumnString face;

  _i3.AppointmentTable? ___appointments;

  _i1.ManyRelation<_i3.AppointmentTable>? _appointments;

  _i4.MembershipTable? ___membership;

  _i1.ManyRelation<_i4.MembershipTable>? _membership;

  late final _i1.ColumnInt asTrainerId;

  _i5.TrainerTable? _asTrainer;

  _i2.UserInfoTable get userInfo {
    if (_userInfo != null) return _userInfo!;
    _userInfo = _i1.createRelationTable(
      relationFieldName: 'userInfo',
      field: User.t.userInfoId,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _userInfo!;
  }

  _i3.AppointmentTable get __appointments {
    if (___appointments != null) return ___appointments!;
    ___appointments = _i1.createRelationTable(
      relationFieldName: '__appointments',
      field: User.t.id,
      foreignField: _i3.Appointment.t.userId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.AppointmentTable(tableRelation: foreignTableRelation),
    );
    return ___appointments!;
  }

  _i4.MembershipTable get __membership {
    if (___membership != null) return ___membership!;
    ___membership = _i1.createRelationTable(
      relationFieldName: '__membership',
      field: User.t.id,
      foreignField: _i4.Membership.t.userId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.MembershipTable(tableRelation: foreignTableRelation),
    );
    return ___membership!;
  }

  _i5.TrainerTable get asTrainer {
    if (_asTrainer != null) return _asTrainer!;
    _asTrainer = _i1.createRelationTable(
      relationFieldName: 'asTrainer',
      field: User.t.asTrainerId,
      foreignField: _i5.Trainer.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.TrainerTable(tableRelation: foreignTableRelation),
    );
    return _asTrainer!;
  }

  _i1.ManyRelation<_i3.AppointmentTable> get appointments {
    if (_appointments != null) return _appointments!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'appointments',
      field: User.t.id,
      foreignField: _i3.Appointment.t.userId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.AppointmentTable(tableRelation: foreignTableRelation),
    );
    _appointments = _i1.ManyRelation<_i3.AppointmentTable>(
      tableWithRelations: relationTable,
      table: _i3.AppointmentTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _appointments!;
  }

  _i1.ManyRelation<_i4.MembershipTable> get membership {
    if (_membership != null) return _membership!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'membership',
      field: User.t.id,
      foreignField: _i4.Membership.t.userId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.MembershipTable(tableRelation: foreignTableRelation),
    );
    _membership = _i1.ManyRelation<_i4.MembershipTable>(
      tableWithRelations: relationTable,
      table: _i4.MembershipTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _membership!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        userInfoId,
        gender,
        birthday,
        mobile,
        suspended,
        headshot,
        face,
        asTrainerId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'userInfo') {
      return userInfo;
    }
    if (relationField == 'appointments') {
      return __appointments;
    }
    if (relationField == 'membership') {
      return __membership;
    }
    if (relationField == 'asTrainer') {
      return asTrainer;
    }
    return null;
  }
}

class UserInclude extends _i1.IncludeObject {
  UserInclude._({
    _i2.UserInfoInclude? userInfo,
    _i3.AppointmentIncludeList? appointments,
    _i4.MembershipIncludeList? membership,
    _i5.TrainerInclude? asTrainer,
  }) {
    _userInfo = userInfo;
    _appointments = appointments;
    _membership = membership;
    _asTrainer = asTrainer;
  }

  _i2.UserInfoInclude? _userInfo;

  _i3.AppointmentIncludeList? _appointments;

  _i4.MembershipIncludeList? _membership;

  _i5.TrainerInclude? _asTrainer;

  @override
  Map<String, _i1.Include?> get includes => {
        'userInfo': _userInfo,
        'appointments': _appointments,
        'membership': _membership,
        'asTrainer': _asTrainer,
      };

  @override
  _i1.Table<int> get table => User.t;
}

class UserIncludeList extends _i1.IncludeList {
  UserIncludeList._({
    _i1.WhereExpressionBuilder<UserTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(User.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int> get table => User.t;
}

class UserRepository {
  const UserRepository._();

  final attach = const UserAttachRepository._();

  final attachRow = const UserAttachRowRepository._();

  final detachRow = const UserDetachRowRepository._();

  /// Returns a list of [User]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<User>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.find<User>(
      where: where?.call(User.t),
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [User] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<User?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.findFirstRow<User>(
      where: where?.call(User.t),
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [User] by its [id] or null if no such row exists.
  Future<User?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.findById<User>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [User]s in the list and returns the inserted rows.
  ///
  /// The returned [User]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<User>> insert(
    _i1.Session session,
    List<User> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<User>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [User] and returns the inserted row.
  ///
  /// The returned [User] will have its `id` field set.
  Future<User> insertRow(
    _i1.Session session,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<User>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [User]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<User>> update(
    _i1.Session session,
    List<User> rows, {
    _i1.ColumnSelections<UserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<User>(
      rows,
      columns: columns?.call(User.t),
      transaction: transaction,
    );
  }

  /// Updates a single [User]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<User> updateRow(
    _i1.Session session,
    User row, {
    _i1.ColumnSelections<UserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<User>(
      row,
      columns: columns?.call(User.t),
      transaction: transaction,
    );
  }

  /// Deletes all [User]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<User>> delete(
    _i1.Session session,
    List<User> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<User>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [User].
  Future<User> deleteRow(
    _i1.Session session,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<User>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<User>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<User>(
      where: where(User.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<User>(
      where: where?.call(User.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class UserAttachRepository {
  const UserAttachRepository._();

  /// Creates a relation between this [User] and the given [Appointment]s
  /// by setting each [Appointment]'s foreign key `userId` to refer to this [User].
  Future<void> appointments(
    _i1.Session session,
    User user,
    List<_i3.Appointment> appointment, {
    _i1.Transaction? transaction,
  }) async {
    if (appointment.any((e) => e.id == null)) {
      throw ArgumentError.notNull('appointment.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $appointment =
        appointment.map((e) => e.copyWith(userId: user.id)).toList();
    await session.db.update<_i3.Appointment>(
      $appointment,
      columns: [_i3.Appointment.t.userId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [User] and the given [Membership]s
  /// by setting each [Membership]'s foreign key `userId` to refer to this [User].
  Future<void> membership(
    _i1.Session session,
    User user,
    List<_i4.Membership> membership, {
    _i1.Transaction? transaction,
  }) async {
    if (membership.any((e) => e.id == null)) {
      throw ArgumentError.notNull('membership.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $membership =
        membership.map((e) => e.copyWith(userId: user.id)).toList();
    await session.db.update<_i4.Membership>(
      $membership,
      columns: [_i4.Membership.t.userId],
      transaction: transaction,
    );
  }
}

class UserAttachRowRepository {
  const UserAttachRowRepository._();

  /// Creates a relation between the given [User] and [UserInfo]
  /// by setting the [User]'s foreign key `userInfoId` to refer to the [UserInfo].
  Future<void> userInfo(
    _i1.Session session,
    User user,
    _i2.UserInfo userInfo, {
    _i1.Transaction? transaction,
  }) async {
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }
    if (userInfo.id == null) {
      throw ArgumentError.notNull('userInfo.id');
    }

    var $user = user.copyWith(userInfoId: userInfo.id);
    await session.db.updateRow<User>(
      $user,
      columns: [User.t.userInfoId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [User] and [Trainer]
  /// by setting the [User]'s foreign key `asTrainerId` to refer to the [Trainer].
  Future<void> asTrainer(
    _i1.Session session,
    User user,
    _i5.Trainer asTrainer, {
    _i1.Transaction? transaction,
  }) async {
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }
    if (asTrainer.id == null) {
      throw ArgumentError.notNull('asTrainer.id');
    }

    var $user = user.copyWith(asTrainerId: asTrainer.id);
    await session.db.updateRow<User>(
      $user,
      columns: [User.t.asTrainerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [User] and the given [Appointment]
  /// by setting the [Appointment]'s foreign key `userId` to refer to this [User].
  Future<void> appointments(
    _i1.Session session,
    User user,
    _i3.Appointment appointment, {
    _i1.Transaction? transaction,
  }) async {
    if (appointment.id == null) {
      throw ArgumentError.notNull('appointment.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $appointment = appointment.copyWith(userId: user.id);
    await session.db.updateRow<_i3.Appointment>(
      $appointment,
      columns: [_i3.Appointment.t.userId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [User] and the given [Membership]
  /// by setting the [Membership]'s foreign key `userId` to refer to this [User].
  Future<void> membership(
    _i1.Session session,
    User user,
    _i4.Membership membership, {
    _i1.Transaction? transaction,
  }) async {
    if (membership.id == null) {
      throw ArgumentError.notNull('membership.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $membership = membership.copyWith(userId: user.id);
    await session.db.updateRow<_i4.Membership>(
      $membership,
      columns: [_i4.Membership.t.userId],
      transaction: transaction,
    );
  }
}

class UserDetachRowRepository {
  const UserDetachRowRepository._();

  /// Detaches the relation between this [User] and the [Trainer] set in `asTrainer`
  /// by setting the [User]'s foreign key `asTrainerId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> asTrainer(
    _i1.Session session,
    User user, {
    _i1.Transaction? transaction,
  }) async {
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $user = user.copyWith(asTrainerId: null);
    await session.db.updateRow<User>(
      $user,
      columns: [User.t.asTrainerId],
      transaction: transaction,
    );
  }
}
