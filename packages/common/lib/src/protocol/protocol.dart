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
import 'appointment.dart' as _i3;
import 'bargain.dart' as _i4;
import 'brand.dart' as _i5;
import 'card.dart' as _i6;
import 'coupon.dart' as _i7;
import 'db_exception.dart' as _i8;
import 'db_exception_status.dart' as _i9;
import 'example.dart' as _i10;
import 'invoice.dart' as _i11;
import 'member.dart' as _i12;
import 'membership.dart' as _i13;
import 'note.dart' as _i14;
import 'order.dart' as _i15;
import 'permission.dart' as _i16;
import 'product.dart' as _i17;
import 'role.dart' as _i18;
import 'serving.dart' as _i19;
import 'store.dart' as _i20;
import 'tenant.dart' as _i21;
import 'trade/card_type.dart' as _i22;
import 'trainer.dart' as _i23;
import 'user.dart' as _i24;
import 'package:preso_common/src/protocol/note.dart' as _i25;
import 'package:preso_common/src/protocol/store.dart' as _i26;
import 'package:preso_common/src/protocol/tenant.dart' as _i27;
import 'package:preso_common/src/protocol/user.dart' as _i28;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i29;
export 'address.dart';
export 'appointment.dart';
export 'bargain.dart';
export 'brand.dart';
export 'card.dart';
export 'coupon.dart';
export 'db_exception.dart';
export 'db_exception_status.dart';
export 'example.dart';
export 'invoice.dart';
export 'member.dart';
export 'membership.dart';
export 'note.dart';
export 'order.dart';
export 'permission.dart';
export 'product.dart';
export 'role.dart';
export 'serving.dart';
export 'store.dart';
export 'tenant.dart';
export 'trade/card_type.dart';
export 'trainer.dart';
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
    if (t == _i3.Appointment) {
      return _i3.Appointment.fromJson(data) as T;
    }
    if (t == _i4.Bargain) {
      return _i4.Bargain.fromJson(data) as T;
    }
    if (t == _i5.Brand) {
      return _i5.Brand.fromJson(data) as T;
    }
    if (t == _i6.Card) {
      return _i6.Card.fromJson(data) as T;
    }
    if (t == _i7.Coupon) {
      return _i7.Coupon.fromJson(data) as T;
    }
    if (t == _i8.DbException) {
      return _i8.DbException.fromJson(data) as T;
    }
    if (t == _i9.ExType) {
      return _i9.ExType.fromJson(data) as T;
    }
    if (t == _i10.Example) {
      return _i10.Example.fromJson(data) as T;
    }
    if (t == _i11.Invoice) {
      return _i11.Invoice.fromJson(data) as T;
    }
    if (t == _i12.Member) {
      return _i12.Member.fromJson(data) as T;
    }
    if (t == _i13.Membership) {
      return _i13.Membership.fromJson(data) as T;
    }
    if (t == _i14.Note) {
      return _i14.Note.fromJson(data) as T;
    }
    if (t == _i15.Order) {
      return _i15.Order.fromJson(data) as T;
    }
    if (t == _i16.Permission) {
      return _i16.Permission.fromJson(data) as T;
    }
    if (t == _i17.Product) {
      return _i17.Product.fromJson(data) as T;
    }
    if (t == _i18.Role) {
      return _i18.Role.fromJson(data) as T;
    }
    if (t == _i19.Serving) {
      return _i19.Serving.fromJson(data) as T;
    }
    if (t == _i20.Store) {
      return _i20.Store.fromJson(data) as T;
    }
    if (t == _i21.Tenant) {
      return _i21.Tenant.fromJson(data) as T;
    }
    if (t == _i22.CardType) {
      return _i22.CardType.fromJson(data) as T;
    }
    if (t == _i23.Trainer) {
      return _i23.Trainer.fromJson(data) as T;
    }
    if (t == _i24.User) {
      return _i24.User.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Address?>()) {
      return (data != null ? _i2.Address.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Appointment?>()) {
      return (data != null ? _i3.Appointment.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Bargain?>()) {
      return (data != null ? _i4.Bargain.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Brand?>()) {
      return (data != null ? _i5.Brand.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Card?>()) {
      return (data != null ? _i6.Card.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Coupon?>()) {
      return (data != null ? _i7.Coupon.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.DbException?>()) {
      return (data != null ? _i8.DbException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.ExType?>()) {
      return (data != null ? _i9.ExType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Example?>()) {
      return (data != null ? _i10.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.Invoice?>()) {
      return (data != null ? _i11.Invoice.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.Member?>()) {
      return (data != null ? _i12.Member.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.Membership?>()) {
      return (data != null ? _i13.Membership.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.Note?>()) {
      return (data != null ? _i14.Note.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.Order?>()) {
      return (data != null ? _i15.Order.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.Permission?>()) {
      return (data != null ? _i16.Permission.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.Product?>()) {
      return (data != null ? _i17.Product.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.Role?>()) {
      return (data != null ? _i18.Role.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.Serving?>()) {
      return (data != null ? _i19.Serving.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.Store?>()) {
      return (data != null ? _i20.Store.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.Tenant?>()) {
      return (data != null ? _i21.Tenant.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.CardType?>()) {
      return (data != null ? _i22.CardType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.Trainer?>()) {
      return (data != null ? _i23.Trainer.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.User?>()) {
      return (data != null ? _i24.User.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i3.Appointment>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i3.Appointment>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i13.Membership>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i13.Membership>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i6.Card>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i6.Card>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i19.Serving>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i19.Serving>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i13.Membership>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i13.Membership>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i19.Serving>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i19.Serving>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i3.Appointment>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i3.Appointment>(e)).toList()
          : null) as T;
    }
    if (t == List<_i25.Note>) {
      return (data as List).map((e) => deserialize<_i25.Note>(e)).toList() as T;
    }
    if (t == List<_i26.Store>) {
      return (data as List).map((e) => deserialize<_i26.Store>(e)).toList()
          as T;
    }
    if (t == List<_i27.Tenant>) {
      return (data as List).map((e) => deserialize<_i27.Tenant>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i28.User>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i28.User>(e)).toList()
          : null) as T;
    }
    try {
      return _i29.Protocol().deserialize<T>(data, t);
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
    if (data is _i3.Appointment) {
      return 'Appointment';
    }
    if (data is _i4.Bargain) {
      return 'Bargain';
    }
    if (data is _i5.Brand) {
      return 'Brand';
    }
    if (data is _i6.Card) {
      return 'Card';
    }
    if (data is _i7.Coupon) {
      return 'Coupon';
    }
    if (data is _i8.DbException) {
      return 'DbException';
    }
    if (data is _i9.ExType) {
      return 'ExType';
    }
    if (data is _i10.Example) {
      return 'Example';
    }
    if (data is _i11.Invoice) {
      return 'Invoice';
    }
    if (data is _i12.Member) {
      return 'Member';
    }
    if (data is _i13.Membership) {
      return 'Membership';
    }
    if (data is _i14.Note) {
      return 'Note';
    }
    if (data is _i15.Order) {
      return 'Order';
    }
    if (data is _i16.Permission) {
      return 'Permission';
    }
    if (data is _i17.Product) {
      return 'Product';
    }
    if (data is _i18.Role) {
      return 'Role';
    }
    if (data is _i19.Serving) {
      return 'Serving';
    }
    if (data is _i20.Store) {
      return 'Store';
    }
    if (data is _i21.Tenant) {
      return 'Tenant';
    }
    if (data is _i22.CardType) {
      return 'CardType';
    }
    if (data is _i23.Trainer) {
      return 'Trainer';
    }
    if (data is _i24.User) {
      return 'User';
    }
    className = _i29.Protocol().getClassNameForObject(data);
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
    if (dataClassName == 'Appointment') {
      return deserialize<_i3.Appointment>(data['data']);
    }
    if (dataClassName == 'Bargain') {
      return deserialize<_i4.Bargain>(data['data']);
    }
    if (dataClassName == 'Brand') {
      return deserialize<_i5.Brand>(data['data']);
    }
    if (dataClassName == 'Card') {
      return deserialize<_i6.Card>(data['data']);
    }
    if (dataClassName == 'Coupon') {
      return deserialize<_i7.Coupon>(data['data']);
    }
    if (dataClassName == 'DbException') {
      return deserialize<_i8.DbException>(data['data']);
    }
    if (dataClassName == 'ExType') {
      return deserialize<_i9.ExType>(data['data']);
    }
    if (dataClassName == 'Example') {
      return deserialize<_i10.Example>(data['data']);
    }
    if (dataClassName == 'Invoice') {
      return deserialize<_i11.Invoice>(data['data']);
    }
    if (dataClassName == 'Member') {
      return deserialize<_i12.Member>(data['data']);
    }
    if (dataClassName == 'Membership') {
      return deserialize<_i13.Membership>(data['data']);
    }
    if (dataClassName == 'Note') {
      return deserialize<_i14.Note>(data['data']);
    }
    if (dataClassName == 'Order') {
      return deserialize<_i15.Order>(data['data']);
    }
    if (dataClassName == 'Permission') {
      return deserialize<_i16.Permission>(data['data']);
    }
    if (dataClassName == 'Product') {
      return deserialize<_i17.Product>(data['data']);
    }
    if (dataClassName == 'Role') {
      return deserialize<_i18.Role>(data['data']);
    }
    if (dataClassName == 'Serving') {
      return deserialize<_i19.Serving>(data['data']);
    }
    if (dataClassName == 'Store') {
      return deserialize<_i20.Store>(data['data']);
    }
    if (dataClassName == 'Tenant') {
      return deserialize<_i21.Tenant>(data['data']);
    }
    if (dataClassName == 'CardType') {
      return deserialize<_i22.CardType>(data['data']);
    }
    if (dataClassName == 'Trainer') {
      return deserialize<_i23.Trainer>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i24.User>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i29.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
