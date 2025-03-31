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
import 'trade/card_type.dart' as _i2;

abstract class Card implements _i1.TableRow, _i1.ProtocolSerialization {
  Card._({
    this.id,
    required this.tenantId,
    required this.name,
    required this.description,
    required this.price,
    required this.coverImage,
    required this.duration,
    this.type,
  });

  factory Card({
    int? id,
    required int tenantId,
    required String name,
    required String description,
    required double price,
    required String coverImage,
    required int duration,
    _i2.CardType? type,
  }) = _CardImpl;

  factory Card.fromJson(Map<String, dynamic> jsonSerialization) {
    return Card(
      id: jsonSerialization['id'] as int?,
      tenantId: jsonSerialization['tenantId'] as int,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      price: (jsonSerialization['price'] as num).toDouble(),
      coverImage: jsonSerialization['coverImage'] as String,
      duration: jsonSerialization['duration'] as int,
      type: jsonSerialization['type'] == null
          ? null
          : _i2.CardType.fromJson((jsonSerialization['type'] as String)),
    );
  }

  static final t = CardTable();

  static const db = CardRepository._();

  @override
  int? id;

  int tenantId;

  String name;

  String description;

  double price;

  String coverImage;

  int duration;

  _i2.CardType? type;

  int? _storeCardsStoreId;

  @override
  _i1.Table get table => t;

  /// Returns a shallow copy of this [Card]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Card copyWith({
    int? id,
    int? tenantId,
    String? name,
    String? description,
    double? price,
    String? coverImage,
    int? duration,
    _i2.CardType? type,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'tenantId': tenantId,
      'name': name,
      'description': description,
      'price': price,
      'coverImage': coverImage,
      'duration': duration,
      if (type != null) 'type': type?.toJson(),
      if (_storeCardsStoreId != null) '_storeCardsStoreId': _storeCardsStoreId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'tenantId': tenantId,
      'name': name,
      'description': description,
      'price': price,
      'coverImage': coverImage,
      'duration': duration,
      if (type != null) 'type': type?.toJson(),
    };
  }

  static CardInclude include() {
    return CardInclude._();
  }

  static CardIncludeList includeList({
    _i1.WhereExpressionBuilder<CardTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CardTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CardTable>? orderByList,
    CardInclude? include,
  }) {
    return CardIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Card.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Card.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CardImpl extends Card {
  _CardImpl({
    int? id,
    required int tenantId,
    required String name,
    required String description,
    required double price,
    required String coverImage,
    required int duration,
    _i2.CardType? type,
  }) : super._(
          id: id,
          tenantId: tenantId,
          name: name,
          description: description,
          price: price,
          coverImage: coverImage,
          duration: duration,
          type: type,
        );

  /// Returns a shallow copy of this [Card]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Card copyWith({
    Object? id = _Undefined,
    int? tenantId,
    String? name,
    String? description,
    double? price,
    String? coverImage,
    int? duration,
    Object? type = _Undefined,
  }) {
    return Card(
      id: id is int? ? id : this.id,
      tenantId: tenantId ?? this.tenantId,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      coverImage: coverImage ?? this.coverImage,
      duration: duration ?? this.duration,
      type: type is _i2.CardType? ? type : this.type,
    );
  }
}

class CardImplicit extends _CardImpl {
  CardImplicit._({
    int? id,
    required int tenantId,
    required String name,
    required String description,
    required double price,
    required String coverImage,
    required int duration,
    _i2.CardType? type,
    this.$_storeCardsStoreId,
  }) : super(
          id: id,
          tenantId: tenantId,
          name: name,
          description: description,
          price: price,
          coverImage: coverImage,
          duration: duration,
          type: type,
        );

  factory CardImplicit(
    Card card, {
    int? $_storeCardsStoreId,
  }) {
    return CardImplicit._(
      id: card.id,
      tenantId: card.tenantId,
      name: card.name,
      description: card.description,
      price: card.price,
      coverImage: card.coverImage,
      duration: card.duration,
      type: card.type,
      $_storeCardsStoreId: $_storeCardsStoreId,
    );
  }

  int? $_storeCardsStoreId;

  @override
  Map<String, dynamic> toJson() {
    var jsonMap = super.toJson();
    jsonMap.addAll({'_storeCardsStoreId': $_storeCardsStoreId});
    return jsonMap;
  }
}

class CardTable extends _i1.Table {
  CardTable({super.tableRelation}) : super(tableName: 'card') {
    tenantId = _i1.ColumnInt(
      'tenantId',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    price = _i1.ColumnDouble(
      'price',
      this,
    );
    coverImage = _i1.ColumnString(
      'coverImage',
      this,
    );
    duration = _i1.ColumnInt(
      'duration',
      this,
    );
    type = _i1.ColumnEnum(
      'type',
      this,
      _i1.EnumSerialization.byName,
    );
    $_storeCardsStoreId = _i1.ColumnInt(
      '_storeCardsStoreId',
      this,
    );
  }

  late final _i1.ColumnInt tenantId;

  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  late final _i1.ColumnDouble price;

  late final _i1.ColumnString coverImage;

  late final _i1.ColumnInt duration;

  late final _i1.ColumnEnum<_i2.CardType> type;

  late final _i1.ColumnInt $_storeCardsStoreId;

  @override
  List<_i1.Column> get columns => [
        id,
        tenantId,
        name,
        description,
        price,
        coverImage,
        duration,
        type,
        $_storeCardsStoreId,
      ];
}

class CardInclude extends _i1.IncludeObject {
  CardInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Card.t;
}

class CardIncludeList extends _i1.IncludeList {
  CardIncludeList._({
    _i1.WhereExpressionBuilder<CardTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Card.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Card.t;
}

class CardRepository {
  const CardRepository._();

  /// Returns a list of [Card]s matching the given query parameters.
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
  Future<List<Card>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CardTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CardTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CardTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Card>(
      where: where?.call(Card.t),
      orderBy: orderBy?.call(Card.t),
      orderByList: orderByList?.call(Card.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Card] matching the given query parameters.
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
  Future<Card?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CardTable>? where,
    int? offset,
    _i1.OrderByBuilder<CardTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CardTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Card>(
      where: where?.call(Card.t),
      orderBy: orderBy?.call(Card.t),
      orderByList: orderByList?.call(Card.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Card] by its [id] or null if no such row exists.
  Future<Card?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Card>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Card]s in the list and returns the inserted rows.
  ///
  /// The returned [Card]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Card>> insert(
    _i1.Session session,
    List<Card> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Card>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Card] and returns the inserted row.
  ///
  /// The returned [Card] will have its `id` field set.
  Future<Card> insertRow(
    _i1.Session session,
    Card row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Card>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Card]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Card>> update(
    _i1.Session session,
    List<Card> rows, {
    _i1.ColumnSelections<CardTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Card>(
      rows,
      columns: columns?.call(Card.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Card]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Card> updateRow(
    _i1.Session session,
    Card row, {
    _i1.ColumnSelections<CardTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Card>(
      row,
      columns: columns?.call(Card.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Card]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Card>> delete(
    _i1.Session session,
    List<Card> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Card>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Card].
  Future<Card> deleteRow(
    _i1.Session session,
    Card row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Card>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Card>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CardTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Card>(
      where: where(Card.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CardTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Card>(
      where: where?.call(Card.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
