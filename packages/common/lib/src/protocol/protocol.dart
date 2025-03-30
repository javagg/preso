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
import 'address.dart' as _i2;
import 'bargain.dart' as _i3;
import 'brand.dart' as _i4;
import 'coupon.dart' as _i5;
import 'db_exception.dart' as _i6;
import 'db_exception_status.dart' as _i7;
import 'example.dart' as _i8;
import 'tenantable.dart' as _i9;
import 'node.dart' as _i10;
import 'order.dart' as _i11;
import 'permission.dart' as _i12;
import 'role.dart' as _i13;
import 'tenant.dart' as _i14;
import 'trade/card_type.dart' as _i15;
import 'user.dart' as _i16;
import 'package:preso_common/src/protocol/node.dart' as _i17;
import 'package:preso_common/src/protocol/tenantable.dart' as _i18;
import 'package:preso_common/src/protocol/tenant.dart' as _i19;
import 'package:preso_common/src/protocol/user.dart' as _i20;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i21;
export 'address.dart';
export 'bargain.dart';
export 'brand.dart';
export 'coupon.dart';
export 'db_exception.dart';
export 'db_exception_status.dart';
export 'example.dart';
export 'node.dart';
export 'order.dart';
export 'permission.dart';
export 'role.dart';
export 'tenant.dart';
export 'tenantable.dart';
export 'trade/card_type.dart';
export 'user.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Address) {
      return _i2.Address.fromJson(data) as T;
    }
    if (t == _i3.Bargain) {
      return _i3.Bargain.fromJson(data) as T;
    }
    if (t == _i4.Brand) {
      return _i4.Brand.fromJson(data) as T;
    }
    if (t == _i5.Coupon) {
      return _i5.Coupon.fromJson(data) as T;
    }
    if (t == _i6.DbException) {
      return _i6.DbException.fromJson(data) as T;
    }
    if (t == _i7.ExType) {
      return _i7.ExType.fromJson(data) as T;
    }
    if (t == _i8.Example) {
      return _i8.Example.fromJson(data) as T;
    }
    if (t == _i9.Invoice) {
      return _i9.Invoice.fromJson(data) as T;
    }
    if (t == _i10.Note) {
      return _i10.Note.fromJson(data) as T;
    }
    if (t == _i11.Order) {
      return _i11.Order.fromJson(data) as T;
    }
    if (t == _i12.Permission) {
      return _i12.Permission.fromJson(data) as T;
    }
    if (t == _i13.Role) {
      return _i13.Role.fromJson(data) as T;
    }
    if (t == _i9.Store) {
      return _i9.Store.fromJson(data) as T;
    }
    if (t == _i14.Tenant) {
      return _i14.Tenant.fromJson(data) as T;
    }
    if (t == _i15.CardType) {
      return _i15.CardType.fromJson(data) as T;
    }
    if (t == _i16.User) {
      return _i16.User.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Address?>()) {
      return (data != null ? _i2.Address.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Bargain?>()) {
      return (data != null ? _i3.Bargain.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Brand?>()) {
      return (data != null ? _i4.Brand.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Coupon?>()) {
      return (data != null ? _i5.Coupon.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.DbException?>()) {
      return (data != null ? _i6.DbException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.ExType?>()) {
      return (data != null ? _i7.ExType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Example?>()) {
      return (data != null ? _i8.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Invoice?>()) {
      return (data != null ? _i9.Invoice.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Note?>()) {
      return (data != null ? _i10.Note.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.Order?>()) {
      return (data != null ? _i11.Order.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.Permission?>()) {
      return (data != null ? _i12.Permission.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.Role?>()) {
      return (data != null ? _i13.Role.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Store?>()) {
      return (data != null ? _i9.Store.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.Tenant?>()) {
      return (data != null ? _i14.Tenant.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.CardType?>()) {
      return (data != null ? _i15.CardType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.User?>()) {
      return (data != null ? _i16.User.fromJson(data) : null) as T;
    }
    if (t == List<_i17.Note>) {
      return (data as List).map((e) => deserialize<_i17.Note>(e)).toList() as T;
    }
    if (t == List<_i18.Store>) {
      return (data as List).map((e) => deserialize<_i18.Store>(e)).toList()
          as T;
    }
    if (t == List<_i19.Tenant>) {
      return (data as List).map((e) => deserialize<_i19.Tenant>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i20.User>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i20.User>(e)).toList()
          : null) as T;
    }
    try {
      return _i21.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Address) {
      return 'Address';
    }
    if (data is _i3.Bargain) {
      return 'Bargain';
    }
    if (data is _i4.Brand) {
      return 'Brand';
    }
    if (data is _i5.Coupon) {
      return 'Coupon';
    }
    if (data is _i6.DbException) {
      return 'DbException';
    }
    if (data is _i7.ExType) {
      return 'ExType';
    }
    if (data is _i8.Example) {
      return 'Example';
    }
    if (data is _i9.Invoice) {
      return 'Invoice';
    }
    if (data is _i10.Note) {
      return 'Note';
    }
    if (data is _i11.Order) {
      return 'Order';
    }
    if (data is _i12.Permission) {
      return 'Permission';
    }
    if (data is _i13.Role) {
      return 'Role';
    }
    if (data is _i9.Store) {
      return 'Store';
    }
    if (data is _i14.Tenant) {
      return 'Tenant';
    }
    if (data is _i15.CardType) {
      return 'CardType';
    }
    if (data is _i16.User) {
      return 'User';
    }
    className = _i21.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Address') {
      return deserialize<_i2.Address>(data['data']);
    }
    if (dataClassName == 'Bargain') {
      return deserialize<_i3.Bargain>(data['data']);
    }
    if (dataClassName == 'Brand') {
      return deserialize<_i4.Brand>(data['data']);
    }
    if (dataClassName == 'Coupon') {
      return deserialize<_i5.Coupon>(data['data']);
    }
    if (dataClassName == 'DbException') {
      return deserialize<_i6.DbException>(data['data']);
    }
    if (dataClassName == 'ExType') {
      return deserialize<_i7.ExType>(data['data']);
    }
    if (dataClassName == 'Example') {
      return deserialize<_i8.Example>(data['data']);
    }
    if (dataClassName == 'Invoice') {
      return deserialize<_i9.Invoice>(data['data']);
    }
    if (dataClassName == 'Note') {
      return deserialize<_i10.Note>(data['data']);
    }
    if (dataClassName == 'Order') {
      return deserialize<_i11.Order>(data['data']);
    }
    if (dataClassName == 'Permission') {
      return deserialize<_i12.Permission>(data['data']);
    }
    if (dataClassName == 'Role') {
      return deserialize<_i13.Role>(data['data']);
    }
    if (dataClassName == 'Store') {
      return deserialize<_i9.Store>(data['data']);
    }
    if (dataClassName == 'Tenant') {
      return deserialize<_i14.Tenant>(data['data']);
    }
    if (dataClassName == 'CardType') {
      return deserialize<_i15.CardType>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i16.User>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i21.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
