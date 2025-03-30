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
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;
import 'address.dart' as _i4;
import 'bargain.dart' as _i5;
import 'brand.dart' as _i6;
import 'coupon.dart' as _i7;
import 'db_exception.dart' as _i8;
import 'db_exception_status.dart' as _i9;
import 'example.dart' as _i10;
import 'tenantable.dart' as _i11;
import 'node.dart' as _i12;
import 'order.dart' as _i13;
import 'permission.dart' as _i14;
import 'role.dart' as _i15;
import 'tenant.dart' as _i16;
import 'trade/card_type.dart' as _i17;
import 'user.dart' as _i18;
import 'package:preso_server/src/generated/node.dart' as _i19;
import 'package:preso_server/src/generated/tenantable.dart' as _i20;
import 'package:preso_server/src/generated/tenant.dart' as _i21;
import 'package:preso_server/src/generated/user.dart' as _i22;
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

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'address',
      dartName: 'Address',
      schema: 'public',
      module: 'preso',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'address_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'street',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'address_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'bargain',
      dartName: 'Bargain',
      schema: 'public',
      module: 'preso',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'bargain_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'bargain_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'brand',
      dartName: 'Brand',
      schema: 'public',
      module: 'preso',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'brand_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'logo',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'website',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'brand_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'coupon',
      dartName: 'Coupon',
      schema: 'public',
      module: 'preso',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'coupon_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'coupon_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'invoice',
      dartName: 'Invoice',
      schema: 'public',
      module: 'preso',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'invoice_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'tenantId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'invoice_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'note',
      dartName: 'Note',
      schema: 'public',
      module: 'preso',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'note_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'text',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'note_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'order',
      dartName: 'Order',
      schema: 'public',
      module: 'preso',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'order_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'no',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'order_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'permission',
      dartName: 'Permission',
      schema: 'public',
      module: 'preso',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'permission_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'permission_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'role',
      dartName: 'Role',
      schema: 'public',
      module: 'preso',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'role_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'role_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'store',
      dartName: 'Store',
      schema: 'public',
      module: 'preso',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'store_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'tenantId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'addressId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'store_fk_0',
          columns: ['addressId'],
          referenceTable: 'address',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'store_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'tenant',
      dartName: 'Tenant',
      schema: 'public',
      module: 'preso',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'tenant_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'tenant_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'user',
      dartName: 'User',
      schema: 'public',
      module: 'preso',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'user_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'userInfoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'user_fk_0',
          columns: ['userInfoId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.cascade,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'user_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i4.Address) {
      return _i4.Address.fromJson(data) as T;
    }
    if (t == _i5.Bargain) {
      return _i5.Bargain.fromJson(data) as T;
    }
    if (t == _i6.Brand) {
      return _i6.Brand.fromJson(data) as T;
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
    if (t == _i12.Note) {
      return _i12.Note.fromJson(data) as T;
    }
    if (t == _i13.Order) {
      return _i13.Order.fromJson(data) as T;
    }
    if (t == _i14.Permission) {
      return _i14.Permission.fromJson(data) as T;
    }
    if (t == _i15.Role) {
      return _i15.Role.fromJson(data) as T;
    }
    if (t == _i11.Store) {
      return _i11.Store.fromJson(data) as T;
    }
    if (t == _i16.Tenant) {
      return _i16.Tenant.fromJson(data) as T;
    }
    if (t == _i17.CardType) {
      return _i17.CardType.fromJson(data) as T;
    }
    if (t == _i18.User) {
      return _i18.User.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.Address?>()) {
      return (data != null ? _i4.Address.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Bargain?>()) {
      return (data != null ? _i5.Bargain.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Brand?>()) {
      return (data != null ? _i6.Brand.fromJson(data) : null) as T;
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
    if (t == _i1.getType<_i12.Note?>()) {
      return (data != null ? _i12.Note.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.Order?>()) {
      return (data != null ? _i13.Order.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.Permission?>()) {
      return (data != null ? _i14.Permission.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.Role?>()) {
      return (data != null ? _i15.Role.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.Store?>()) {
      return (data != null ? _i11.Store.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.Tenant?>()) {
      return (data != null ? _i16.Tenant.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.CardType?>()) {
      return (data != null ? _i17.CardType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.User?>()) {
      return (data != null ? _i18.User.fromJson(data) : null) as T;
    }
    if (t == List<_i19.Note>) {
      return (data as List).map((e) => deserialize<_i19.Note>(e)).toList() as T;
    }
    if (t == List<_i20.Store>) {
      return (data as List).map((e) => deserialize<_i20.Store>(e)).toList()
          as T;
    }
    if (t == List<_i21.Tenant>) {
      return (data as List).map((e) => deserialize<_i21.Tenant>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i22.User>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i22.User>(e)).toList()
          : null) as T;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i4.Address) {
      return 'Address';
    }
    if (data is _i5.Bargain) {
      return 'Bargain';
    }
    if (data is _i6.Brand) {
      return 'Brand';
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
    if (data is _i12.Note) {
      return 'Note';
    }
    if (data is _i13.Order) {
      return 'Order';
    }
    if (data is _i14.Permission) {
      return 'Permission';
    }
    if (data is _i15.Role) {
      return 'Role';
    }
    if (data is _i11.Store) {
      return 'Store';
    }
    if (data is _i16.Tenant) {
      return 'Tenant';
    }
    if (data is _i17.CardType) {
      return 'CardType';
    }
    if (data is _i18.User) {
      return 'User';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
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
      return deserialize<_i4.Address>(data['data']);
    }
    if (dataClassName == 'Bargain') {
      return deserialize<_i5.Bargain>(data['data']);
    }
    if (dataClassName == 'Brand') {
      return deserialize<_i6.Brand>(data['data']);
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
    if (dataClassName == 'Note') {
      return deserialize<_i12.Note>(data['data']);
    }
    if (dataClassName == 'Order') {
      return deserialize<_i13.Order>(data['data']);
    }
    if (dataClassName == 'Permission') {
      return deserialize<_i14.Permission>(data['data']);
    }
    if (dataClassName == 'Role') {
      return deserialize<_i15.Role>(data['data']);
    }
    if (dataClassName == 'Store') {
      return deserialize<_i11.Store>(data['data']);
    }
    if (dataClassName == 'Tenant') {
      return deserialize<_i16.Tenant>(data['data']);
    }
    if (dataClassName == 'CardType') {
      return deserialize<_i17.CardType>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i18.User>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i3.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i4.Address:
        return _i4.Address.t;
      case _i5.Bargain:
        return _i5.Bargain.t;
      case _i6.Brand:
        return _i6.Brand.t;
      case _i7.Coupon:
        return _i7.Coupon.t;
      case _i11.Invoice:
        return _i11.Invoice.t;
      case _i12.Note:
        return _i12.Note.t;
      case _i13.Order:
        return _i13.Order.t;
      case _i14.Permission:
        return _i14.Permission.t;
      case _i15.Role:
        return _i15.Role.t;
      case _i11.Store:
        return _i11.Store.t;
      case _i16.Tenant:
        return _i16.Tenant.t;
      case _i18.User:
        return _i18.User.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'preso';
}
