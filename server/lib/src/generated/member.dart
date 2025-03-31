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
import 'appointment.dart' as _i2;
import 'membership.dart' as _i3;

abstract class Member implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = MemberTable();

  static const db = MemberRepository._();

  @override
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

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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
        'appointments':
            appointments?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (membership != null)
        'membership':
            membership?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static MemberInclude include({
    _i2.AppointmentIncludeList? appointments,
    _i3.MembershipIncludeList? membership,
  }) {
    return MemberInclude._(
      appointments: appointments,
      membership: membership,
    );
  }

  static MemberIncludeList includeList({
    _i1.WhereExpressionBuilder<MemberTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MemberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MemberTable>? orderByList,
    MemberInclude? include,
  }) {
    return MemberIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Member.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Member.t),
      include: include,
    );
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

class MemberTable extends _i1.Table {
  MemberTable({super.tableRelation}) : super(tableName: 'member') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    gender = _i1.ColumnString(
      'gender',
      this,
    );
    age = _i1.ColumnInt(
      'age',
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
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnString gender;

  late final _i1.ColumnInt age;

  late final _i1.ColumnString mobile;

  late final _i1.ColumnBool suspended;

  late final _i1.ColumnString headshot;

  late final _i1.ColumnString face;

  _i2.AppointmentTable? ___appointments;

  _i1.ManyRelation<_i2.AppointmentTable>? _appointments;

  _i3.MembershipTable? ___membership;

  _i1.ManyRelation<_i3.MembershipTable>? _membership;

  _i2.AppointmentTable get __appointments {
    if (___appointments != null) return ___appointments!;
    ___appointments = _i1.createRelationTable(
      relationFieldName: '__appointments',
      field: Member.t.id,
      foreignField: _i2.Appointment.t.memberId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.AppointmentTable(tableRelation: foreignTableRelation),
    );
    return ___appointments!;
  }

  _i3.MembershipTable get __membership {
    if (___membership != null) return ___membership!;
    ___membership = _i1.createRelationTable(
      relationFieldName: '__membership',
      field: Member.t.id,
      foreignField: _i3.Membership.t.memberId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.MembershipTable(tableRelation: foreignTableRelation),
    );
    return ___membership!;
  }

  _i1.ManyRelation<_i2.AppointmentTable> get appointments {
    if (_appointments != null) return _appointments!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'appointments',
      field: Member.t.id,
      foreignField: _i2.Appointment.t.memberId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.AppointmentTable(tableRelation: foreignTableRelation),
    );
    _appointments = _i1.ManyRelation<_i2.AppointmentTable>(
      tableWithRelations: relationTable,
      table: _i2.AppointmentTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _appointments!;
  }

  _i1.ManyRelation<_i3.MembershipTable> get membership {
    if (_membership != null) return _membership!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'membership',
      field: Member.t.id,
      foreignField: _i3.Membership.t.memberId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.MembershipTable(tableRelation: foreignTableRelation),
    );
    _membership = _i1.ManyRelation<_i3.MembershipTable>(
      tableWithRelations: relationTable,
      table: _i3.MembershipTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _membership!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        gender,
        age,
        mobile,
        suspended,
        headshot,
        face,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'appointments') {
      return __appointments;
    }
    if (relationField == 'membership') {
      return __membership;
    }
    return null;
  }
}

class MemberInclude extends _i1.IncludeObject {
  MemberInclude._({
    _i2.AppointmentIncludeList? appointments,
    _i3.MembershipIncludeList? membership,
  }) {
    _appointments = appointments;
    _membership = membership;
  }

  _i2.AppointmentIncludeList? _appointments;

  _i3.MembershipIncludeList? _membership;

  @override
  Map<String, _i1.Include?> get includes => {
        'appointments': _appointments,
        'membership': _membership,
      };

  @override
  _i1.Table get table => Member.t;
}

class MemberIncludeList extends _i1.IncludeList {
  MemberIncludeList._({
    _i1.WhereExpressionBuilder<MemberTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Member.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Member.t;
}

class MemberRepository {
  const MemberRepository._();

  final attach = const MemberAttachRepository._();

  final attachRow = const MemberAttachRowRepository._();

  final detach = const MemberDetachRepository._();

  final detachRow = const MemberDetachRowRepository._();

  /// Returns a list of [Member]s matching the given query parameters.
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
  Future<List<Member>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MemberTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MemberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MemberTable>? orderByList,
    _i1.Transaction? transaction,
    MemberInclude? include,
  }) async {
    return session.db.find<Member>(
      where: where?.call(Member.t),
      orderBy: orderBy?.call(Member.t),
      orderByList: orderByList?.call(Member.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Member] matching the given query parameters.
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
  Future<Member?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MemberTable>? where,
    int? offset,
    _i1.OrderByBuilder<MemberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MemberTable>? orderByList,
    _i1.Transaction? transaction,
    MemberInclude? include,
  }) async {
    return session.db.findFirstRow<Member>(
      where: where?.call(Member.t),
      orderBy: orderBy?.call(Member.t),
      orderByList: orderByList?.call(Member.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Member] by its [id] or null if no such row exists.
  Future<Member?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    MemberInclude? include,
  }) async {
    return session.db.findById<Member>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Member]s in the list and returns the inserted rows.
  ///
  /// The returned [Member]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Member>> insert(
    _i1.Session session,
    List<Member> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Member>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Member] and returns the inserted row.
  ///
  /// The returned [Member] will have its `id` field set.
  Future<Member> insertRow(
    _i1.Session session,
    Member row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Member>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Member]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Member>> update(
    _i1.Session session,
    List<Member> rows, {
    _i1.ColumnSelections<MemberTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Member>(
      rows,
      columns: columns?.call(Member.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Member]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Member> updateRow(
    _i1.Session session,
    Member row, {
    _i1.ColumnSelections<MemberTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Member>(
      row,
      columns: columns?.call(Member.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Member]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Member>> delete(
    _i1.Session session,
    List<Member> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Member>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Member].
  Future<Member> deleteRow(
    _i1.Session session,
    Member row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Member>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Member>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MemberTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Member>(
      where: where(Member.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MemberTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Member>(
      where: where?.call(Member.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class MemberAttachRepository {
  const MemberAttachRepository._();

  /// Creates a relation between this [Member] and the given [Appointment]s
  /// by setting each [Appointment]'s foreign key `memberId` to refer to this [Member].
  Future<void> appointments(
    _i1.Session session,
    Member member,
    List<_i2.Appointment> appointment, {
    _i1.Transaction? transaction,
  }) async {
    if (appointment.any((e) => e.id == null)) {
      throw ArgumentError.notNull('appointment.id');
    }
    if (member.id == null) {
      throw ArgumentError.notNull('member.id');
    }

    var $appointment =
        appointment.map((e) => e.copyWith(memberId: member.id)).toList();
    await session.db.update<_i2.Appointment>(
      $appointment,
      columns: [_i2.Appointment.t.memberId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Member] and the given [Membership]s
  /// by setting each [Membership]'s foreign key `memberId` to refer to this [Member].
  Future<void> membership(
    _i1.Session session,
    Member member,
    List<_i3.Membership> membership, {
    _i1.Transaction? transaction,
  }) async {
    if (membership.any((e) => e.id == null)) {
      throw ArgumentError.notNull('membership.id');
    }
    if (member.id == null) {
      throw ArgumentError.notNull('member.id');
    }

    var $membership =
        membership.map((e) => e.copyWith(memberId: member.id)).toList();
    await session.db.update<_i3.Membership>(
      $membership,
      columns: [_i3.Membership.t.memberId],
      transaction: transaction,
    );
  }
}

class MemberAttachRowRepository {
  const MemberAttachRowRepository._();

  /// Creates a relation between this [Member] and the given [Appointment]
  /// by setting the [Appointment]'s foreign key `memberId` to refer to this [Member].
  Future<void> appointments(
    _i1.Session session,
    Member member,
    _i2.Appointment appointment, {
    _i1.Transaction? transaction,
  }) async {
    if (appointment.id == null) {
      throw ArgumentError.notNull('appointment.id');
    }
    if (member.id == null) {
      throw ArgumentError.notNull('member.id');
    }

    var $appointment = appointment.copyWith(memberId: member.id);
    await session.db.updateRow<_i2.Appointment>(
      $appointment,
      columns: [_i2.Appointment.t.memberId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Member] and the given [Membership]
  /// by setting the [Membership]'s foreign key `memberId` to refer to this [Member].
  Future<void> membership(
    _i1.Session session,
    Member member,
    _i3.Membership membership, {
    _i1.Transaction? transaction,
  }) async {
    if (membership.id == null) {
      throw ArgumentError.notNull('membership.id');
    }
    if (member.id == null) {
      throw ArgumentError.notNull('member.id');
    }

    var $membership = membership.copyWith(memberId: member.id);
    await session.db.updateRow<_i3.Membership>(
      $membership,
      columns: [_i3.Membership.t.memberId],
      transaction: transaction,
    );
  }
}

class MemberDetachRepository {
  const MemberDetachRepository._();

  /// Detaches the relation between this [Member] and the given [Membership]
  /// by setting the [Membership]'s foreign key `memberId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> membership(
    _i1.Session session,
    List<_i3.Membership> membership, {
    _i1.Transaction? transaction,
  }) async {
    if (membership.any((e) => e.id == null)) {
      throw ArgumentError.notNull('membership.id');
    }

    var $membership =
        membership.map((e) => e.copyWith(memberId: null)).toList();
    await session.db.update<_i3.Membership>(
      $membership,
      columns: [_i3.Membership.t.memberId],
      transaction: transaction,
    );
  }
}

class MemberDetachRowRepository {
  const MemberDetachRowRepository._();

  /// Detaches the relation between this [Member] and the given [Membership]
  /// by setting the [Membership]'s foreign key `memberId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> membership(
    _i1.Session session,
    _i3.Membership membership, {
    _i1.Transaction? transaction,
  }) async {
    if (membership.id == null) {
      throw ArgumentError.notNull('membership.id');
    }

    var $membership = membership.copyWith(memberId: null);
    await session.db.updateRow<_i3.Membership>(
      $membership,
      columns: [_i3.Membership.t.memberId],
      transaction: transaction,
    );
  }
}
