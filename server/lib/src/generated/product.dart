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
import 'store.dart' as _i2;

abstract class Product implements _i1.TableRow, _i1.ProtocolSerialization {
  Product._({
    this.id,
    required this.tenantId,
    required this.name,
    required this.description,
    bool? offShelf,
    required this.price,
    required this.storeId,
    this.store,
    bool? applicableToAllStores,
  })  : offShelf = offShelf ?? true,
        applicableToAllStores = applicableToAllStores ?? false;

  factory Product({
    int? id,
    required int tenantId,
    required String name,
    required String description,
    bool? offShelf,
    required double price,
    required int storeId,
    _i2.Store? store,
    bool? applicableToAllStores,
  }) = _ProductImpl;

  factory Product.fromJson(Map<String, dynamic> jsonSerialization) {
    return Product(
      id: jsonSerialization['id'] as int?,
      tenantId: jsonSerialization['tenantId'] as int,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String,
      offShelf: jsonSerialization['offShelf'] as bool,
      price: (jsonSerialization['price'] as num).toDouble(),
      storeId: jsonSerialization['storeId'] as int,
      store: jsonSerialization['store'] == null
          ? null
          : _i2.Store.fromJson(
              (jsonSerialization['store'] as Map<String, dynamic>)),
      applicableToAllStores: jsonSerialization['applicableToAllStores'] as bool,
    );
  }

  static final t = ProductTable();

  static const db = ProductRepository._();

  @override
  int? id;

  int tenantId;

  String name;

  String description;

  bool offShelf;

  double price;

  int storeId;

  _i2.Store? store;

  bool applicableToAllStores;

  @override
  _i1.Table get table => t;

  /// Returns a shallow copy of this [Product]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Product copyWith({
    int? id,
    int? tenantId,
    String? name,
    String? description,
    bool? offShelf,
    double? price,
    int? storeId,
    _i2.Store? store,
    bool? applicableToAllStores,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'tenantId': tenantId,
      'name': name,
      'description': description,
      'offShelf': offShelf,
      'price': price,
      'storeId': storeId,
      if (store != null) 'store': store?.toJson(),
      'applicableToAllStores': applicableToAllStores,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'tenantId': tenantId,
      'name': name,
      'description': description,
      'offShelf': offShelf,
      'price': price,
      'storeId': storeId,
      if (store != null) 'store': store?.toJsonForProtocol(),
      'applicableToAllStores': applicableToAllStores,
    };
  }

  static ProductInclude include({_i2.StoreInclude? store}) {
    return ProductInclude._(store: store);
  }

  static ProductIncludeList includeList({
    _i1.WhereExpressionBuilder<ProductTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductTable>? orderByList,
    ProductInclude? include,
  }) {
    return ProductIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Product.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Product.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProductImpl extends Product {
  _ProductImpl({
    int? id,
    required int tenantId,
    required String name,
    required String description,
    bool? offShelf,
    required double price,
    required int storeId,
    _i2.Store? store,
    bool? applicableToAllStores,
  }) : super._(
          id: id,
          tenantId: tenantId,
          name: name,
          description: description,
          offShelf: offShelf,
          price: price,
          storeId: storeId,
          store: store,
          applicableToAllStores: applicableToAllStores,
        );

  /// Returns a shallow copy of this [Product]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Product copyWith({
    Object? id = _Undefined,
    int? tenantId,
    String? name,
    String? description,
    bool? offShelf,
    double? price,
    int? storeId,
    Object? store = _Undefined,
    bool? applicableToAllStores,
  }) {
    return Product(
      id: id is int? ? id : this.id,
      tenantId: tenantId ?? this.tenantId,
      name: name ?? this.name,
      description: description ?? this.description,
      offShelf: offShelf ?? this.offShelf,
      price: price ?? this.price,
      storeId: storeId ?? this.storeId,
      store: store is _i2.Store? ? store : this.store?.copyWith(),
      applicableToAllStores:
          applicableToAllStores ?? this.applicableToAllStores,
    );
  }
}

class ProductTable extends _i1.Table {
  ProductTable({super.tableRelation}) : super(tableName: 'product') {
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
    offShelf = _i1.ColumnBool(
      'offShelf',
      this,
      hasDefault: true,
    );
    price = _i1.ColumnDouble(
      'price',
      this,
    );
    storeId = _i1.ColumnInt(
      'storeId',
      this,
    );
    applicableToAllStores = _i1.ColumnBool(
      'applicableToAllStores',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnInt tenantId;

  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  late final _i1.ColumnBool offShelf;

  late final _i1.ColumnDouble price;

  late final _i1.ColumnInt storeId;

  _i2.StoreTable? _store;

  late final _i1.ColumnBool applicableToAllStores;

  _i2.StoreTable get store {
    if (_store != null) return _store!;
    _store = _i1.createRelationTable(
      relationFieldName: 'store',
      field: Product.t.storeId,
      foreignField: _i2.Store.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.StoreTable(tableRelation: foreignTableRelation),
    );
    return _store!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        tenantId,
        name,
        description,
        offShelf,
        price,
        storeId,
        applicableToAllStores,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'store') {
      return store;
    }
    return null;
  }
}

class ProductInclude extends _i1.IncludeObject {
  ProductInclude._({_i2.StoreInclude? store}) {
    _store = store;
  }

  _i2.StoreInclude? _store;

  @override
  Map<String, _i1.Include?> get includes => {'store': _store};

  @override
  _i1.Table get table => Product.t;
}

class ProductIncludeList extends _i1.IncludeList {
  ProductIncludeList._({
    _i1.WhereExpressionBuilder<ProductTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Product.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Product.t;
}

class ProductRepository {
  const ProductRepository._();

  final attachRow = const ProductAttachRowRepository._();

  /// Returns a list of [Product]s matching the given query parameters.
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
  Future<List<Product>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ProductTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductTable>? orderByList,
    _i1.Transaction? transaction,
    ProductInclude? include,
  }) async {
    return session.db.find<Product>(
      where: where?.call(Product.t),
      orderBy: orderBy?.call(Product.t),
      orderByList: orderByList?.call(Product.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Product] matching the given query parameters.
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
  Future<Product?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductTable>? where,
    int? offset,
    _i1.OrderByBuilder<ProductTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ProductTable>? orderByList,
    _i1.Transaction? transaction,
    ProductInclude? include,
  }) async {
    return session.db.findFirstRow<Product>(
      where: where?.call(Product.t),
      orderBy: orderBy?.call(Product.t),
      orderByList: orderByList?.call(Product.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Product] by its [id] or null if no such row exists.
  Future<Product?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ProductInclude? include,
  }) async {
    return session.db.findById<Product>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Product]s in the list and returns the inserted rows.
  ///
  /// The returned [Product]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Product>> insert(
    _i1.Session session,
    List<Product> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Product>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Product] and returns the inserted row.
  ///
  /// The returned [Product] will have its `id` field set.
  Future<Product> insertRow(
    _i1.Session session,
    Product row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Product>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Product]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Product>> update(
    _i1.Session session,
    List<Product> rows, {
    _i1.ColumnSelections<ProductTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Product>(
      rows,
      columns: columns?.call(Product.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Product]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Product> updateRow(
    _i1.Session session,
    Product row, {
    _i1.ColumnSelections<ProductTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Product>(
      row,
      columns: columns?.call(Product.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Product]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Product>> delete(
    _i1.Session session,
    List<Product> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Product>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Product].
  Future<Product> deleteRow(
    _i1.Session session,
    Product row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Product>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Product>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ProductTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Product>(
      where: where(Product.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ProductTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Product>(
      where: where?.call(Product.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ProductAttachRowRepository {
  const ProductAttachRowRepository._();

  /// Creates a relation between the given [Product] and [Store]
  /// by setting the [Product]'s foreign key `storeId` to refer to the [Store].
  Future<void> store(
    _i1.Session session,
    Product product,
    _i2.Store store, {
    _i1.Transaction? transaction,
  }) async {
    if (product.id == null) {
      throw ArgumentError.notNull('product.id');
    }
    if (store.id == null) {
      throw ArgumentError.notNull('store.id');
    }

    var $product = product.copyWith(storeId: store.id);
    await session.db.updateRow<Product>(
      $product,
      columns: [Product.t.storeId],
      transaction: transaction,
    );
  }
}
