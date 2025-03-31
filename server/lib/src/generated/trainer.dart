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
import 'serving.dart' as _i2;
import 'appointment.dart' as _i3;

abstract class Trainer implements _i1.TableRow, _i1.ProtocolSerialization {
  Trainer._({
    this.id,
    required this.name,
    required this.description,
    required this.gender,
    required this.age,
    required this.headshot,
    required this.photos,
    required this.videos,
    required this.servingCity,
    required this.servingHours,
    this.serving,
    this.appointments,
    required this.classFee,
    required this.phone,
    int? hotness,
    double? rating,
  })  : hotness = hotness ?? 0,
        rating = rating ?? 0.0;

  factory Trainer({
    int? id,
    required String name,
    required String description,
    required String gender,
    required int age,
    required String headshot,
    required String photos,
    required String videos,
    required String servingCity,
    required String servingHours,
    List<_i2.Serving>? serving,
    List<_i3.Appointment>? appointments,
    required double classFee,
    required String phone,
    int? hotness,
    double? rating,
  }) = _TrainerImpl;

  factory Trainer.fromJson(Map<String, dynamic> jsonSerialization) {
    return Trainer(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      gender: jsonSerialization['gender'] as String,
      age: jsonSerialization['age'] as int,
      headshot: jsonSerialization['headshot'] as String,
      photos: jsonSerialization['photos'] as String,
      videos: jsonSerialization['videos'] as String,
      servingCity: jsonSerialization['servingCity'] as String,
      servingHours: jsonSerialization['servingHours'] as String,
      serving: (jsonSerialization['serving'] as List?)
          ?.map((e) => _i2.Serving.fromJson((e as Map<String, dynamic>)))
          .toList(),
      appointments: (jsonSerialization['appointments'] as List?)
          ?.map((e) => _i3.Appointment.fromJson((e as Map<String, dynamic>)))
          .toList(),
      classFee: (jsonSerialization['classFee'] as num).toDouble(),
      phone: jsonSerialization['phone'] as String,
      hotness: jsonSerialization['hotness'] as int,
      rating: (jsonSerialization['rating'] as num).toDouble(),
    );
  }

  static final t = TrainerTable();

  static const db = TrainerRepository._();

  @override
  int? id;

  String name;

  String description;

  String gender;

  int age;

  String headshot;

  String photos;

  String videos;

  String servingCity;

  String servingHours;

  List<_i2.Serving>? serving;

  List<_i3.Appointment>? appointments;

  double classFee;

  String phone;

  int hotness;

  double rating;

  @override
  _i1.Table get table => t;

  /// Returns a shallow copy of this [Trainer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Trainer copyWith({
    int? id,
    String? name,
    String? description,
    String? gender,
    int? age,
    String? headshot,
    String? photos,
    String? videos,
    String? servingCity,
    String? servingHours,
    List<_i2.Serving>? serving,
    List<_i3.Appointment>? appointments,
    double? classFee,
    String? phone,
    int? hotness,
    double? rating,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      'gender': gender,
      'age': age,
      'headshot': headshot,
      'photos': photos,
      'videos': videos,
      'servingCity': servingCity,
      'servingHours': servingHours,
      if (serving != null)
        'serving': serving?.toJson(valueToJson: (v) => v.toJson()),
      if (appointments != null)
        'appointments': appointments?.toJson(valueToJson: (v) => v.toJson()),
      'classFee': classFee,
      'phone': phone,
      'hotness': hotness,
      'rating': rating,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'description': description,
      'gender': gender,
      'age': age,
      'headshot': headshot,
      'photos': photos,
      'videos': videos,
      'servingCity': servingCity,
      'servingHours': servingHours,
      if (serving != null)
        'serving': serving?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (appointments != null)
        'appointments':
            appointments?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'classFee': classFee,
      'phone': phone,
      'hotness': hotness,
      'rating': rating,
    };
  }

  static TrainerInclude include({
    _i2.ServingIncludeList? serving,
    _i3.AppointmentIncludeList? appointments,
  }) {
    return TrainerInclude._(
      serving: serving,
      appointments: appointments,
    );
  }

  static TrainerIncludeList includeList({
    _i1.WhereExpressionBuilder<TrainerTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TrainerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TrainerTable>? orderByList,
    TrainerInclude? include,
  }) {
    return TrainerIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Trainer.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Trainer.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TrainerImpl extends Trainer {
  _TrainerImpl({
    int? id,
    required String name,
    required String description,
    required String gender,
    required int age,
    required String headshot,
    required String photos,
    required String videos,
    required String servingCity,
    required String servingHours,
    List<_i2.Serving>? serving,
    List<_i3.Appointment>? appointments,
    required double classFee,
    required String phone,
    int? hotness,
    double? rating,
  }) : super._(
          id: id,
          name: name,
          description: description,
          gender: gender,
          age: age,
          headshot: headshot,
          photos: photos,
          videos: videos,
          servingCity: servingCity,
          servingHours: servingHours,
          serving: serving,
          appointments: appointments,
          classFee: classFee,
          phone: phone,
          hotness: hotness,
          rating: rating,
        );

  /// Returns a shallow copy of this [Trainer]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Trainer copyWith({
    Object? id = _Undefined,
    String? name,
    String? description,
    String? gender,
    int? age,
    String? headshot,
    String? photos,
    String? videos,
    String? servingCity,
    String? servingHours,
    Object? serving = _Undefined,
    Object? appointments = _Undefined,
    double? classFee,
    String? phone,
    int? hotness,
    double? rating,
  }) {
    return Trainer(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      headshot: headshot ?? this.headshot,
      photos: photos ?? this.photos,
      videos: videos ?? this.videos,
      servingCity: servingCity ?? this.servingCity,
      servingHours: servingHours ?? this.servingHours,
      serving: serving is List<_i2.Serving>?
          ? serving
          : this.serving?.map((e0) => e0.copyWith()).toList(),
      appointments: appointments is List<_i3.Appointment>?
          ? appointments
          : this.appointments?.map((e0) => e0.copyWith()).toList(),
      classFee: classFee ?? this.classFee,
      phone: phone ?? this.phone,
      hotness: hotness ?? this.hotness,
      rating: rating ?? this.rating,
    );
  }
}

class TrainerTable extends _i1.Table {
  TrainerTable({super.tableRelation}) : super(tableName: 'trainer') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    description = _i1.ColumnString(
      'description',
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
    headshot = _i1.ColumnString(
      'headshot',
      this,
    );
    photos = _i1.ColumnString(
      'photos',
      this,
    );
    videos = _i1.ColumnString(
      'videos',
      this,
    );
    servingCity = _i1.ColumnString(
      'servingCity',
      this,
    );
    servingHours = _i1.ColumnString(
      'servingHours',
      this,
    );
    classFee = _i1.ColumnDouble(
      'classFee',
      this,
    );
    phone = _i1.ColumnString(
      'phone',
      this,
    );
    hotness = _i1.ColumnInt(
      'hotness',
      this,
      hasDefault: true,
    );
    rating = _i1.ColumnDouble(
      'rating',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  late final _i1.ColumnString gender;

  late final _i1.ColumnInt age;

  late final _i1.ColumnString headshot;

  late final _i1.ColumnString photos;

  late final _i1.ColumnString videos;

  late final _i1.ColumnString servingCity;

  late final _i1.ColumnString servingHours;

  _i2.ServingTable? ___serving;

  _i1.ManyRelation<_i2.ServingTable>? _serving;

  _i3.AppointmentTable? ___appointments;

  _i1.ManyRelation<_i3.AppointmentTable>? _appointments;

  late final _i1.ColumnDouble classFee;

  late final _i1.ColumnString phone;

  late final _i1.ColumnInt hotness;

  late final _i1.ColumnDouble rating;

  _i2.ServingTable get __serving {
    if (___serving != null) return ___serving!;
    ___serving = _i1.createRelationTable(
      relationFieldName: '__serving',
      field: Trainer.t.id,
      foreignField: _i2.Serving.t.trainerId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ServingTable(tableRelation: foreignTableRelation),
    );
    return ___serving!;
  }

  _i3.AppointmentTable get __appointments {
    if (___appointments != null) return ___appointments!;
    ___appointments = _i1.createRelationTable(
      relationFieldName: '__appointments',
      field: Trainer.t.id,
      foreignField: _i3.Appointment.t.trainerId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.AppointmentTable(tableRelation: foreignTableRelation),
    );
    return ___appointments!;
  }

  _i1.ManyRelation<_i2.ServingTable> get serving {
    if (_serving != null) return _serving!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'serving',
      field: Trainer.t.id,
      foreignField: _i2.Serving.t.trainerId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ServingTable(tableRelation: foreignTableRelation),
    );
    _serving = _i1.ManyRelation<_i2.ServingTable>(
      tableWithRelations: relationTable,
      table: _i2.ServingTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _serving!;
  }

  _i1.ManyRelation<_i3.AppointmentTable> get appointments {
    if (_appointments != null) return _appointments!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'appointments',
      field: Trainer.t.id,
      foreignField: _i3.Appointment.t.trainerId,
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

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        description,
        gender,
        age,
        headshot,
        photos,
        videos,
        servingCity,
        servingHours,
        classFee,
        phone,
        hotness,
        rating,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'serving') {
      return __serving;
    }
    if (relationField == 'appointments') {
      return __appointments;
    }
    return null;
  }
}

class TrainerInclude extends _i1.IncludeObject {
  TrainerInclude._({
    _i2.ServingIncludeList? serving,
    _i3.AppointmentIncludeList? appointments,
  }) {
    _serving = serving;
    _appointments = appointments;
  }

  _i2.ServingIncludeList? _serving;

  _i3.AppointmentIncludeList? _appointments;

  @override
  Map<String, _i1.Include?> get includes => {
        'serving': _serving,
        'appointments': _appointments,
      };

  @override
  _i1.Table get table => Trainer.t;
}

class TrainerIncludeList extends _i1.IncludeList {
  TrainerIncludeList._({
    _i1.WhereExpressionBuilder<TrainerTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Trainer.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Trainer.t;
}

class TrainerRepository {
  const TrainerRepository._();

  final attach = const TrainerAttachRepository._();

  final attachRow = const TrainerAttachRowRepository._();

  /// Returns a list of [Trainer]s matching the given query parameters.
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
  Future<List<Trainer>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TrainerTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TrainerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TrainerTable>? orderByList,
    _i1.Transaction? transaction,
    TrainerInclude? include,
  }) async {
    return session.db.find<Trainer>(
      where: where?.call(Trainer.t),
      orderBy: orderBy?.call(Trainer.t),
      orderByList: orderByList?.call(Trainer.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Trainer] matching the given query parameters.
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
  Future<Trainer?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TrainerTable>? where,
    int? offset,
    _i1.OrderByBuilder<TrainerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TrainerTable>? orderByList,
    _i1.Transaction? transaction,
    TrainerInclude? include,
  }) async {
    return session.db.findFirstRow<Trainer>(
      where: where?.call(Trainer.t),
      orderBy: orderBy?.call(Trainer.t),
      orderByList: orderByList?.call(Trainer.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Trainer] by its [id] or null if no such row exists.
  Future<Trainer?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    TrainerInclude? include,
  }) async {
    return session.db.findById<Trainer>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Trainer]s in the list and returns the inserted rows.
  ///
  /// The returned [Trainer]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Trainer>> insert(
    _i1.Session session,
    List<Trainer> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Trainer>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Trainer] and returns the inserted row.
  ///
  /// The returned [Trainer] will have its `id` field set.
  Future<Trainer> insertRow(
    _i1.Session session,
    Trainer row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Trainer>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Trainer]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Trainer>> update(
    _i1.Session session,
    List<Trainer> rows, {
    _i1.ColumnSelections<TrainerTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Trainer>(
      rows,
      columns: columns?.call(Trainer.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Trainer]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Trainer> updateRow(
    _i1.Session session,
    Trainer row, {
    _i1.ColumnSelections<TrainerTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Trainer>(
      row,
      columns: columns?.call(Trainer.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Trainer]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Trainer>> delete(
    _i1.Session session,
    List<Trainer> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Trainer>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Trainer].
  Future<Trainer> deleteRow(
    _i1.Session session,
    Trainer row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Trainer>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Trainer>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TrainerTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Trainer>(
      where: where(Trainer.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TrainerTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Trainer>(
      where: where?.call(Trainer.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class TrainerAttachRepository {
  const TrainerAttachRepository._();

  /// Creates a relation between this [Trainer] and the given [Serving]s
  /// by setting each [Serving]'s foreign key `trainerId` to refer to this [Trainer].
  Future<void> serving(
    _i1.Session session,
    Trainer trainer,
    List<_i2.Serving> serving, {
    _i1.Transaction? transaction,
  }) async {
    if (serving.any((e) => e.id == null)) {
      throw ArgumentError.notNull('serving.id');
    }
    if (trainer.id == null) {
      throw ArgumentError.notNull('trainer.id');
    }

    var $serving =
        serving.map((e) => e.copyWith(trainerId: trainer.id)).toList();
    await session.db.update<_i2.Serving>(
      $serving,
      columns: [_i2.Serving.t.trainerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Trainer] and the given [Appointment]s
  /// by setting each [Appointment]'s foreign key `trainerId` to refer to this [Trainer].
  Future<void> appointments(
    _i1.Session session,
    Trainer trainer,
    List<_i3.Appointment> appointment, {
    _i1.Transaction? transaction,
  }) async {
    if (appointment.any((e) => e.id == null)) {
      throw ArgumentError.notNull('appointment.id');
    }
    if (trainer.id == null) {
      throw ArgumentError.notNull('trainer.id');
    }

    var $appointment =
        appointment.map((e) => e.copyWith(trainerId: trainer.id)).toList();
    await session.db.update<_i3.Appointment>(
      $appointment,
      columns: [_i3.Appointment.t.trainerId],
      transaction: transaction,
    );
  }
}

class TrainerAttachRowRepository {
  const TrainerAttachRowRepository._();

  /// Creates a relation between this [Trainer] and the given [Serving]
  /// by setting the [Serving]'s foreign key `trainerId` to refer to this [Trainer].
  Future<void> serving(
    _i1.Session session,
    Trainer trainer,
    _i2.Serving serving, {
    _i1.Transaction? transaction,
  }) async {
    if (serving.id == null) {
      throw ArgumentError.notNull('serving.id');
    }
    if (trainer.id == null) {
      throw ArgumentError.notNull('trainer.id');
    }

    var $serving = serving.copyWith(trainerId: trainer.id);
    await session.db.updateRow<_i2.Serving>(
      $serving,
      columns: [_i2.Serving.t.trainerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Trainer] and the given [Appointment]
  /// by setting the [Appointment]'s foreign key `trainerId` to refer to this [Trainer].
  Future<void> appointments(
    _i1.Session session,
    Trainer trainer,
    _i3.Appointment appointment, {
    _i1.Transaction? transaction,
  }) async {
    if (appointment.id == null) {
      throw ArgumentError.notNull('appointment.id');
    }
    if (trainer.id == null) {
      throw ArgumentError.notNull('trainer.id');
    }

    var $appointment = appointment.copyWith(trainerId: trainer.id);
    await session.db.updateRow<_i3.Appointment>(
      $appointment,
      columns: [_i3.Appointment.t.trainerId],
      transaction: transaction,
    );
  }
}
