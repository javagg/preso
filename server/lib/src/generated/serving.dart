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
import 'trainer.dart' as _i2;
import 'store.dart' as _i3;

abstract class Serving implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = ServingTable();

  static const db = ServingRepository._();

  @override
  int? id;

  int trainerId;

  _i2.Trainer? trainer;

  int storeId;

  _i3.Store? store;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'trainerId': trainerId,
      if (trainer != null) 'trainer': trainer?.toJsonForProtocol(),
      'storeId': storeId,
      if (store != null) 'store': store?.toJsonForProtocol(),
    };
  }

  static ServingInclude include({
    _i2.TrainerInclude? trainer,
    _i3.StoreInclude? store,
  }) {
    return ServingInclude._(
      trainer: trainer,
      store: store,
    );
  }

  static ServingIncludeList includeList({
    _i1.WhereExpressionBuilder<ServingTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ServingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ServingTable>? orderByList,
    ServingInclude? include,
  }) {
    return ServingIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Serving.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Serving.t),
      include: include,
    );
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

class ServingTable extends _i1.Table {
  ServingTable({super.tableRelation}) : super(tableName: 'serving') {
    trainerId = _i1.ColumnInt(
      'trainerId',
      this,
    );
    storeId = _i1.ColumnInt(
      'storeId',
      this,
    );
  }

  late final _i1.ColumnInt trainerId;

  _i2.TrainerTable? _trainer;

  late final _i1.ColumnInt storeId;

  _i3.StoreTable? _store;

  _i2.TrainerTable get trainer {
    if (_trainer != null) return _trainer!;
    _trainer = _i1.createRelationTable(
      relationFieldName: 'trainer',
      field: Serving.t.trainerId,
      foreignField: _i2.Trainer.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.TrainerTable(tableRelation: foreignTableRelation),
    );
    return _trainer!;
  }

  _i3.StoreTable get store {
    if (_store != null) return _store!;
    _store = _i1.createRelationTable(
      relationFieldName: 'store',
      field: Serving.t.storeId,
      foreignField: _i3.Store.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.StoreTable(tableRelation: foreignTableRelation),
    );
    return _store!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        trainerId,
        storeId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'trainer') {
      return trainer;
    }
    if (relationField == 'store') {
      return store;
    }
    return null;
  }
}

class ServingInclude extends _i1.IncludeObject {
  ServingInclude._({
    _i2.TrainerInclude? trainer,
    _i3.StoreInclude? store,
  }) {
    _trainer = trainer;
    _store = store;
  }

  _i2.TrainerInclude? _trainer;

  _i3.StoreInclude? _store;

  @override
  Map<String, _i1.Include?> get includes => {
        'trainer': _trainer,
        'store': _store,
      };

  @override
  _i1.Table get table => Serving.t;
}

class ServingIncludeList extends _i1.IncludeList {
  ServingIncludeList._({
    _i1.WhereExpressionBuilder<ServingTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Serving.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Serving.t;
}

class ServingRepository {
  const ServingRepository._();

  final attachRow = const ServingAttachRowRepository._();

  /// Returns a list of [Serving]s matching the given query parameters.
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
  Future<List<Serving>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ServingTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ServingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ServingTable>? orderByList,
    _i1.Transaction? transaction,
    ServingInclude? include,
  }) async {
    return session.db.find<Serving>(
      where: where?.call(Serving.t),
      orderBy: orderBy?.call(Serving.t),
      orderByList: orderByList?.call(Serving.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Serving] matching the given query parameters.
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
  Future<Serving?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ServingTable>? where,
    int? offset,
    _i1.OrderByBuilder<ServingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ServingTable>? orderByList,
    _i1.Transaction? transaction,
    ServingInclude? include,
  }) async {
    return session.db.findFirstRow<Serving>(
      where: where?.call(Serving.t),
      orderBy: orderBy?.call(Serving.t),
      orderByList: orderByList?.call(Serving.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Serving] by its [id] or null if no such row exists.
  Future<Serving?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ServingInclude? include,
  }) async {
    return session.db.findById<Serving>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Serving]s in the list and returns the inserted rows.
  ///
  /// The returned [Serving]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Serving>> insert(
    _i1.Session session,
    List<Serving> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Serving>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Serving] and returns the inserted row.
  ///
  /// The returned [Serving] will have its `id` field set.
  Future<Serving> insertRow(
    _i1.Session session,
    Serving row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Serving>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Serving]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Serving>> update(
    _i1.Session session,
    List<Serving> rows, {
    _i1.ColumnSelections<ServingTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Serving>(
      rows,
      columns: columns?.call(Serving.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Serving]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Serving> updateRow(
    _i1.Session session,
    Serving row, {
    _i1.ColumnSelections<ServingTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Serving>(
      row,
      columns: columns?.call(Serving.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Serving]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Serving>> delete(
    _i1.Session session,
    List<Serving> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Serving>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Serving].
  Future<Serving> deleteRow(
    _i1.Session session,
    Serving row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Serving>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Serving>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ServingTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Serving>(
      where: where(Serving.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ServingTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Serving>(
      where: where?.call(Serving.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ServingAttachRowRepository {
  const ServingAttachRowRepository._();

  /// Creates a relation between the given [Serving] and [Trainer]
  /// by setting the [Serving]'s foreign key `trainerId` to refer to the [Trainer].
  Future<void> trainer(
    _i1.Session session,
    Serving serving,
    _i2.Trainer trainer, {
    _i1.Transaction? transaction,
  }) async {
    if (serving.id == null) {
      throw ArgumentError.notNull('serving.id');
    }
    if (trainer.id == null) {
      throw ArgumentError.notNull('trainer.id');
    }

    var $serving = serving.copyWith(trainerId: trainer.id);
    await session.db.updateRow<Serving>(
      $serving,
      columns: [Serving.t.trainerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Serving] and [Store]
  /// by setting the [Serving]'s foreign key `storeId` to refer to the [Store].
  Future<void> store(
    _i1.Session session,
    Serving serving,
    _i3.Store store, {
    _i1.Transaction? transaction,
  }) async {
    if (serving.id == null) {
      throw ArgumentError.notNull('serving.id');
    }
    if (store.id == null) {
      throw ArgumentError.notNull('store.id');
    }

    var $serving = serving.copyWith(storeId: store.id);
    await session.db.updateRow<Serving>(
      $serving,
      columns: [Serving.t.storeId],
      transaction: transaction,
    );
  }
}
