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
import 'user.dart' as _i2;
import 'trainer.dart' as _i3;

abstract class Appointment
    implements _i1.TableRow<int>, _i1.ProtocolSerialization {
  Appointment._({
    this.id,
    required this.userId,
    this.user,
    required this.trainerId,
    this.trainer,
    required this.startTime,
    required this.endTime,
  });

  factory Appointment({
    int? id,
    required int userId,
    _i2.User? user,
    required int trainerId,
    _i3.Trainer? trainer,
    required DateTime startTime,
    required DateTime endTime,
  }) = _AppointmentImpl;

  factory Appointment.fromJson(Map<String, dynamic> jsonSerialization) {
    return Appointment(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i2.User.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
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

  static final t = AppointmentTable();

  static const db = AppointmentRepository._();

  @override
  int? id;

  int userId;

  _i2.User? user;

  int trainerId;

  _i3.Trainer? trainer;

  DateTime startTime;

  DateTime endTime;

  @override
  _i1.Table<int> get table => t;

  /// Returns a shallow copy of this [Appointment]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Appointment copyWith({
    int? id,
    int? userId,
    _i2.User? user,
    int? trainerId,
    _i3.Trainer? trainer,
    DateTime? startTime,
    DateTime? endTime,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      'trainerId': trainerId,
      if (trainer != null) 'trainer': trainer?.toJson(),
      'startTime': startTime.toJson(),
      'endTime': endTime.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJsonForProtocol(),
      'trainerId': trainerId,
      if (trainer != null) 'trainer': trainer?.toJsonForProtocol(),
      'startTime': startTime.toJson(),
      'endTime': endTime.toJson(),
    };
  }

  static AppointmentInclude include({
    _i2.UserInclude? user,
    _i3.TrainerInclude? trainer,
  }) {
    return AppointmentInclude._(
      user: user,
      trainer: trainer,
    );
  }

  static AppointmentIncludeList includeList({
    _i1.WhereExpressionBuilder<AppointmentTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AppointmentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppointmentTable>? orderByList,
    AppointmentInclude? include,
  }) {
    return AppointmentIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Appointment.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Appointment.t),
      include: include,
    );
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
    required int userId,
    _i2.User? user,
    required int trainerId,
    _i3.Trainer? trainer,
    required DateTime startTime,
    required DateTime endTime,
  }) : super._(
          id: id,
          userId: userId,
          user: user,
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
    int? userId,
    Object? user = _Undefined,
    int? trainerId,
    Object? trainer = _Undefined,
    DateTime? startTime,
    DateTime? endTime,
  }) {
    return Appointment(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.User? ? user : this.user?.copyWith(),
      trainerId: trainerId ?? this.trainerId,
      trainer: trainer is _i3.Trainer? ? trainer : this.trainer?.copyWith(),
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }
}

class AppointmentTable extends _i1.Table<int> {
  AppointmentTable({super.tableRelation}) : super(tableName: 'appointment') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    trainerId = _i1.ColumnInt(
      'trainerId',
      this,
    );
    startTime = _i1.ColumnDateTime(
      'startTime',
      this,
    );
    endTime = _i1.ColumnDateTime(
      'endTime',
      this,
    );
  }

  late final _i1.ColumnInt userId;

  _i2.UserTable? _user;

  late final _i1.ColumnInt trainerId;

  _i3.TrainerTable? _trainer;

  late final _i1.ColumnDateTime startTime;

  late final _i1.ColumnDateTime endTime;

  _i2.UserTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: Appointment.t.userId,
      foreignField: _i2.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  _i3.TrainerTable get trainer {
    if (_trainer != null) return _trainer!;
    _trainer = _i1.createRelationTable(
      relationFieldName: 'trainer',
      field: Appointment.t.trainerId,
      foreignField: _i3.Trainer.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.TrainerTable(tableRelation: foreignTableRelation),
    );
    return _trainer!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        trainerId,
        startTime,
        endTime,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    if (relationField == 'trainer') {
      return trainer;
    }
    return null;
  }
}

class AppointmentInclude extends _i1.IncludeObject {
  AppointmentInclude._({
    _i2.UserInclude? user,
    _i3.TrainerInclude? trainer,
  }) {
    _user = user;
    _trainer = trainer;
  }

  _i2.UserInclude? _user;

  _i3.TrainerInclude? _trainer;

  @override
  Map<String, _i1.Include?> get includes => {
        'user': _user,
        'trainer': _trainer,
      };

  @override
  _i1.Table<int> get table => Appointment.t;
}

class AppointmentIncludeList extends _i1.IncludeList {
  AppointmentIncludeList._({
    _i1.WhereExpressionBuilder<AppointmentTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Appointment.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int> get table => Appointment.t;
}

class AppointmentRepository {
  const AppointmentRepository._();

  final attachRow = const AppointmentAttachRowRepository._();

  /// Returns a list of [Appointment]s matching the given query parameters.
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
  Future<List<Appointment>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppointmentTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AppointmentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppointmentTable>? orderByList,
    _i1.Transaction? transaction,
    AppointmentInclude? include,
  }) async {
    return session.db.find<Appointment>(
      where: where?.call(Appointment.t),
      orderBy: orderBy?.call(Appointment.t),
      orderByList: orderByList?.call(Appointment.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Appointment] matching the given query parameters.
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
  Future<Appointment?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppointmentTable>? where,
    int? offset,
    _i1.OrderByBuilder<AppointmentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppointmentTable>? orderByList,
    _i1.Transaction? transaction,
    AppointmentInclude? include,
  }) async {
    return session.db.findFirstRow<Appointment>(
      where: where?.call(Appointment.t),
      orderBy: orderBy?.call(Appointment.t),
      orderByList: orderByList?.call(Appointment.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Appointment] by its [id] or null if no such row exists.
  Future<Appointment?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    AppointmentInclude? include,
  }) async {
    return session.db.findById<Appointment>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Appointment]s in the list and returns the inserted rows.
  ///
  /// The returned [Appointment]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Appointment>> insert(
    _i1.Session session,
    List<Appointment> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Appointment>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Appointment] and returns the inserted row.
  ///
  /// The returned [Appointment] will have its `id` field set.
  Future<Appointment> insertRow(
    _i1.Session session,
    Appointment row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Appointment>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Appointment]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Appointment>> update(
    _i1.Session session,
    List<Appointment> rows, {
    _i1.ColumnSelections<AppointmentTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Appointment>(
      rows,
      columns: columns?.call(Appointment.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Appointment]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Appointment> updateRow(
    _i1.Session session,
    Appointment row, {
    _i1.ColumnSelections<AppointmentTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Appointment>(
      row,
      columns: columns?.call(Appointment.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Appointment]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Appointment>> delete(
    _i1.Session session,
    List<Appointment> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Appointment>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Appointment].
  Future<Appointment> deleteRow(
    _i1.Session session,
    Appointment row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Appointment>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Appointment>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AppointmentTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Appointment>(
      where: where(Appointment.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppointmentTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Appointment>(
      where: where?.call(Appointment.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class AppointmentAttachRowRepository {
  const AppointmentAttachRowRepository._();

  /// Creates a relation between the given [Appointment] and [User]
  /// by setting the [Appointment]'s foreign key `userId` to refer to the [User].
  Future<void> user(
    _i1.Session session,
    Appointment appointment,
    _i2.User user, {
    _i1.Transaction? transaction,
  }) async {
    if (appointment.id == null) {
      throw ArgumentError.notNull('appointment.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $appointment = appointment.copyWith(userId: user.id);
    await session.db.updateRow<Appointment>(
      $appointment,
      columns: [Appointment.t.userId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Appointment] and [Trainer]
  /// by setting the [Appointment]'s foreign key `trainerId` to refer to the [Trainer].
  Future<void> trainer(
    _i1.Session session,
    Appointment appointment,
    _i3.Trainer trainer, {
    _i1.Transaction? transaction,
  }) async {
    if (appointment.id == null) {
      throw ArgumentError.notNull('appointment.id');
    }
    if (trainer.id == null) {
      throw ArgumentError.notNull('trainer.id');
    }

    var $appointment = appointment.copyWith(trainerId: trainer.id);
    await session.db.updateRow<Appointment>(
      $appointment,
      columns: [Appointment.t.trainerId],
      transaction: transaction,
    );
  }
}
