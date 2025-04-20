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
import 'product.dart' as _i2;
import 'user.dart' as _i3;
import 'payment_method.dart' as _i4;
import 'order_status.dart' as _i5;

abstract class Order implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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
