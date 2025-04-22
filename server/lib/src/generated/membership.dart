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
import 'store.dart' as _i3;

abstract class Membership
    implements _i1.TableRow<int>, _i1.ProtocolSerialization {
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

  static final t = MembershipTable();

  static const db = MembershipRepository._();

  @override
  int? id;

  int userId;

  _i2.User? user;

  int storeId;

  _i3.Store? store;

  bool active;

  @override
  _i1.Table<int> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJsonForProtocol(),
      'storeId': storeId,
      if (store != null) 'store': store?.toJsonForProtocol(),
      'active': active,
    };
  }

  static MembershipInclude include({
    _i2.UserInclude? user,
    _i3.StoreInclude? store,
  }) {
    return MembershipInclude._(
      user: user,
      store: store,
    );
  }

  static MembershipIncludeList includeList({
    _i1.WhereExpressionBuilder<MembershipTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MembershipTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MembershipTable>? orderByList,
    MembershipInclude? include,
  }) {
    return MembershipIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Membership.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Membership.t),
      include: include,
    );
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

class MembershipTable extends _i1.Table<int> {
  MembershipTable({super.tableRelation}) : super(tableName: 'membership') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    storeId = _i1.ColumnInt(
      'storeId',
      this,
    );
    active = _i1.ColumnBool(
      'active',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnInt userId;

  _i2.UserTable? _user;

  late final _i1.ColumnInt storeId;

  _i3.StoreTable? _store;

  late final _i1.ColumnBool active;

  _i2.UserTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: Membership.t.userId,
      foreignField: _i2.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  _i3.StoreTable get store {
    if (_store != null) return _store!;
    _store = _i1.createRelationTable(
      relationFieldName: 'store',
      field: Membership.t.storeId,
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
        userId,
        storeId,
        active,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    if (relationField == 'store') {
      return store;
    }
    return null;
  }
}

class MembershipInclude extends _i1.IncludeObject {
  MembershipInclude._({
    _i2.UserInclude? user,
    _i3.StoreInclude? store,
  }) {
    _user = user;
    _store = store;
  }

  _i2.UserInclude? _user;

  _i3.StoreInclude? _store;

  @override
  Map<String, _i1.Include?> get includes => {
        'user': _user,
        'store': _store,
      };

  @override
  _i1.Table<int> get table => Membership.t;
}

class MembershipIncludeList extends _i1.IncludeList {
  MembershipIncludeList._({
    _i1.WhereExpressionBuilder<MembershipTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Membership.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int> get table => Membership.t;
}

class MembershipRepository {
  const MembershipRepository._();

  final attachRow = const MembershipAttachRowRepository._();

  /// Returns a list of [Membership]s matching the given query parameters.
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
  Future<List<Membership>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MembershipTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<MembershipTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MembershipTable>? orderByList,
    _i1.Transaction? transaction,
    MembershipInclude? include,
  }) async {
    return session.db.find<Membership>(
      where: where?.call(Membership.t),
      orderBy: orderBy?.call(Membership.t),
      orderByList: orderByList?.call(Membership.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Membership] matching the given query parameters.
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
  Future<Membership?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MembershipTable>? where,
    int? offset,
    _i1.OrderByBuilder<MembershipTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<MembershipTable>? orderByList,
    _i1.Transaction? transaction,
    MembershipInclude? include,
  }) async {
    return session.db.findFirstRow<Membership>(
      where: where?.call(Membership.t),
      orderBy: orderBy?.call(Membership.t),
      orderByList: orderByList?.call(Membership.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Membership] by its [id] or null if no such row exists.
  Future<Membership?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    MembershipInclude? include,
  }) async {
    return session.db.findById<Membership>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Membership]s in the list and returns the inserted rows.
  ///
  /// The returned [Membership]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Membership>> insert(
    _i1.Session session,
    List<Membership> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Membership>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Membership] and returns the inserted row.
  ///
  /// The returned [Membership] will have its `id` field set.
  Future<Membership> insertRow(
    _i1.Session session,
    Membership row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Membership>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Membership]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Membership>> update(
    _i1.Session session,
    List<Membership> rows, {
    _i1.ColumnSelections<MembershipTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Membership>(
      rows,
      columns: columns?.call(Membership.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Membership]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Membership> updateRow(
    _i1.Session session,
    Membership row, {
    _i1.ColumnSelections<MembershipTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Membership>(
      row,
      columns: columns?.call(Membership.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Membership]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Membership>> delete(
    _i1.Session session,
    List<Membership> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Membership>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Membership].
  Future<Membership> deleteRow(
    _i1.Session session,
    Membership row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Membership>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Membership>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<MembershipTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Membership>(
      where: where(Membership.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<MembershipTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Membership>(
      where: where?.call(Membership.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class MembershipAttachRowRepository {
  const MembershipAttachRowRepository._();

  /// Creates a relation between the given [Membership] and [User]
  /// by setting the [Membership]'s foreign key `userId` to refer to the [User].
  Future<void> user(
    _i1.Session session,
    Membership membership,
    _i2.User user, {
    _i1.Transaction? transaction,
  }) async {
    if (membership.id == null) {
      throw ArgumentError.notNull('membership.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $membership = membership.copyWith(userId: user.id);
    await session.db.updateRow<Membership>(
      $membership,
      columns: [Membership.t.userId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Membership] and [Store]
  /// by setting the [Membership]'s foreign key `storeId` to refer to the [Store].
  Future<void> store(
    _i1.Session session,
    Membership membership,
    _i3.Store store, {
    _i1.Transaction? transaction,
  }) async {
    if (membership.id == null) {
      throw ArgumentError.notNull('membership.id');
    }
    if (store.id == null) {
      throw ArgumentError.notNull('store.id');
    }

    var $membership = membership.copyWith(storeId: store.id);
    await session.db.updateRow<Membership>(
      $membership,
      columns: [Membership.t.storeId],
      transaction: transaction,
    );
  }
}
