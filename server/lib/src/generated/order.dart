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
import 'product.dart' as _i2;
import 'user.dart' as _i3;
import 'payment_method.dart' as _i4;
import 'order_status.dart' as _i5;

abstract class Order implements _i1.TableRow, _i1.ProtocolSerialization {
  Order._({
    this.id,
    required this.price,
    required this.productId,
    this.product,
    required this.createrId,
    this.creater,
    required this.createdAt,
    required this.updatedAt,
    required this.paymentMethod,
    required this.status,
  });

  factory Order({
    int? id,
    required double price,
    required int productId,
    _i2.Product? product,
    required int createrId,
    _i3.User? creater,
    required DateTime createdAt,
    required DateTime updatedAt,
    required _i4.PaymentMethod paymentMethod,
    required _i5.OrderStatus status,
  }) = _OrderImpl;

  factory Order.fromJson(Map<String, dynamic> jsonSerialization) {
    return Order(
      id: jsonSerialization['id'] as int?,
      price: (jsonSerialization['price'] as num).toDouble(),
      productId: jsonSerialization['productId'] as int,
      product: jsonSerialization['product'] == null
          ? null
          : _i2.Product.fromJson(
              (jsonSerialization['product'] as Map<String, dynamic>)),
      createrId: jsonSerialization['createrId'] as int,
      creater: jsonSerialization['creater'] == null
          ? null
          : _i3.User.fromJson(
              (jsonSerialization['creater'] as Map<String, dynamic>)),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      paymentMethod: _i4.PaymentMethod.fromJson(
          (jsonSerialization['paymentMethod'] as String)),
      status: _i5.OrderStatus.fromJson((jsonSerialization['status'] as String)),
    );
  }

  static final t = OrderTable();

  static const db = OrderRepository._();

  @override
  int? id;

  double price;

  int productId;

  _i2.Product? product;

  int createrId;

  _i3.User? creater;

  DateTime createdAt;

  DateTime updatedAt;

  _i4.PaymentMethod paymentMethod;

  _i5.OrderStatus status;

  @override
  _i1.Table get table => t;

  /// Returns a shallow copy of this [Order]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Order copyWith({
    int? id,
    double? price,
    int? productId,
    _i2.Product? product,
    int? createrId,
    _i3.User? creater,
    DateTime? createdAt,
    DateTime? updatedAt,
    _i4.PaymentMethod? paymentMethod,
    _i5.OrderStatus? status,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'price': price,
      'productId': productId,
      if (product != null) 'product': product?.toJson(),
      'createrId': createrId,
      if (creater != null) 'creater': creater?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      'paymentMethod': paymentMethod.toJson(),
      'status': status.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'price': price,
      'productId': productId,
      if (product != null) 'product': product?.toJsonForProtocol(),
      'createrId': createrId,
      if (creater != null) 'creater': creater?.toJsonForProtocol(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      'paymentMethod': paymentMethod.toJson(),
      'status': status.toJson(),
    };
  }

  static OrderInclude include({
    _i2.ProductInclude? product,
    _i3.UserInclude? creater,
  }) {
    return OrderInclude._(
      product: product,
      creater: creater,
    );
  }

  static OrderIncludeList includeList({
    _i1.WhereExpressionBuilder<OrderTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OrderTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OrderTable>? orderByList,
    OrderInclude? include,
  }) {
    return OrderIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Order.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Order.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _OrderImpl extends Order {
  _OrderImpl({
    int? id,
    required double price,
    required int productId,
    _i2.Product? product,
    required int createrId,
    _i3.User? creater,
    required DateTime createdAt,
    required DateTime updatedAt,
    required _i4.PaymentMethod paymentMethod,
    required _i5.OrderStatus status,
  }) : super._(
          id: id,
          price: price,
          productId: productId,
          product: product,
          createrId: createrId,
          creater: creater,
          createdAt: createdAt,
          updatedAt: updatedAt,
          paymentMethod: paymentMethod,
          status: status,
        );

  /// Returns a shallow copy of this [Order]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Order copyWith({
    Object? id = _Undefined,
    double? price,
    int? productId,
    Object? product = _Undefined,
    int? createrId,
    Object? creater = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
    _i4.PaymentMethod? paymentMethod,
    _i5.OrderStatus? status,
  }) {
    return Order(
      id: id is int? ? id : this.id,
      price: price ?? this.price,
      productId: productId ?? this.productId,
      product: product is _i2.Product? ? product : this.product?.copyWith(),
      createrId: createrId ?? this.createrId,
      creater: creater is _i3.User? ? creater : this.creater?.copyWith(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      status: status ?? this.status,
    );
  }
}

class OrderTable extends _i1.Table {
  OrderTable({super.tableRelation}) : super(tableName: 'order') {
    price = _i1.ColumnDouble(
      'price',
      this,
    );
    productId = _i1.ColumnInt(
      'productId',
      this,
    );
    createrId = _i1.ColumnInt(
      'createrId',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
    paymentMethod = _i1.ColumnEnum(
      'paymentMethod',
      this,
      _i1.EnumSerialization.byName,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
    );
  }

  late final _i1.ColumnDouble price;

  late final _i1.ColumnInt productId;

  _i2.ProductTable? _product;

  late final _i1.ColumnInt createrId;

  _i3.UserTable? _creater;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnEnum<_i4.PaymentMethod> paymentMethod;

  late final _i1.ColumnEnum<_i5.OrderStatus> status;

  _i2.ProductTable get product {
    if (_product != null) return _product!;
    _product = _i1.createRelationTable(
      relationFieldName: 'product',
      field: Order.t.productId,
      foreignField: _i2.Product.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ProductTable(tableRelation: foreignTableRelation),
    );
    return _product!;
  }

  _i3.UserTable get creater {
    if (_creater != null) return _creater!;
    _creater = _i1.createRelationTable(
      relationFieldName: 'creater',
      field: Order.t.createrId,
      foreignField: _i3.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.UserTable(tableRelation: foreignTableRelation),
    );
    return _creater!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        price,
        productId,
        createrId,
        createdAt,
        updatedAt,
        paymentMethod,
        status,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'product') {
      return product;
    }
    if (relationField == 'creater') {
      return creater;
    }
    return null;
  }
}

class OrderInclude extends _i1.IncludeObject {
  OrderInclude._({
    _i2.ProductInclude? product,
    _i3.UserInclude? creater,
  }) {
    _product = product;
    _creater = creater;
  }

  _i2.ProductInclude? _product;

  _i3.UserInclude? _creater;

  @override
  Map<String, _i1.Include?> get includes => {
        'product': _product,
        'creater': _creater,
      };

  @override
  _i1.Table get table => Order.t;
}

class OrderIncludeList extends _i1.IncludeList {
  OrderIncludeList._({
    _i1.WhereExpressionBuilder<OrderTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Order.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Order.t;
}

class OrderRepository {
  const OrderRepository._();

  final attachRow = const OrderAttachRowRepository._();

  /// Returns a list of [Order]s matching the given query parameters.
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
  Future<List<Order>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OrderTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OrderTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OrderTable>? orderByList,
    _i1.Transaction? transaction,
    OrderInclude? include,
  }) async {
    return session.db.find<Order>(
      where: where?.call(Order.t),
      orderBy: orderBy?.call(Order.t),
      orderByList: orderByList?.call(Order.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Order] matching the given query parameters.
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
  Future<Order?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OrderTable>? where,
    int? offset,
    _i1.OrderByBuilder<OrderTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OrderTable>? orderByList,
    _i1.Transaction? transaction,
    OrderInclude? include,
  }) async {
    return session.db.findFirstRow<Order>(
      where: where?.call(Order.t),
      orderBy: orderBy?.call(Order.t),
      orderByList: orderByList?.call(Order.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Order] by its [id] or null if no such row exists.
  Future<Order?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    OrderInclude? include,
  }) async {
    return session.db.findById<Order>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Order]s in the list and returns the inserted rows.
  ///
  /// The returned [Order]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Order>> insert(
    _i1.Session session,
    List<Order> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Order>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Order] and returns the inserted row.
  ///
  /// The returned [Order] will have its `id` field set.
  Future<Order> insertRow(
    _i1.Session session,
    Order row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Order>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Order]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Order>> update(
    _i1.Session session,
    List<Order> rows, {
    _i1.ColumnSelections<OrderTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Order>(
      rows,
      columns: columns?.call(Order.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Order]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Order> updateRow(
    _i1.Session session,
    Order row, {
    _i1.ColumnSelections<OrderTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Order>(
      row,
      columns: columns?.call(Order.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Order]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Order>> delete(
    _i1.Session session,
    List<Order> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Order>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Order].
  Future<Order> deleteRow(
    _i1.Session session,
    Order row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Order>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Order>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<OrderTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Order>(
      where: where(Order.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OrderTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Order>(
      where: where?.call(Order.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class OrderAttachRowRepository {
  const OrderAttachRowRepository._();

  /// Creates a relation between the given [Order] and [Product]
  /// by setting the [Order]'s foreign key `productId` to refer to the [Product].
  Future<void> product(
    _i1.Session session,
    Order order,
    _i2.Product product, {
    _i1.Transaction? transaction,
  }) async {
    if (order.id == null) {
      throw ArgumentError.notNull('order.id');
    }
    if (product.id == null) {
      throw ArgumentError.notNull('product.id');
    }

    var $order = order.copyWith(productId: product.id);
    await session.db.updateRow<Order>(
      $order,
      columns: [Order.t.productId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Order] and [User]
  /// by setting the [Order]'s foreign key `createrId` to refer to the [User].
  Future<void> creater(
    _i1.Session session,
    Order order,
    _i3.User creater, {
    _i1.Transaction? transaction,
  }) async {
    if (order.id == null) {
      throw ArgumentError.notNull('order.id');
    }
    if (creater.id == null) {
      throw ArgumentError.notNull('creater.id');
    }

    var $order = order.copyWith(createrId: creater.id);
    await session.db.updateRow<Order>(
      $order,
      columns: [Order.t.createrId],
      transaction: transaction,
    );
  }
}
