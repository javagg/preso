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
import 'appointment.dart' as _i5;
import 'bargain.dart' as _i6;
import 'brand.dart' as _i7;
import 'card.dart' as _i8;
import 'coupon.dart' as _i9;
import 'db_exception.dart' as _i10;
import 'db_exception_status.dart' as _i11;
import 'example.dart' as _i12;
import 'invoice.dart' as _i13;
import 'log.dart' as _i14;
import 'membership.dart' as _i15;
import 'note.dart' as _i16;
import 'op_type.dart' as _i17;
import 'order.dart' as _i18;
import 'order_status.dart' as _i19;
import 'payment_method.dart' as _i20;
import 'permission.dart' as _i21;
import 'product.dart' as _i22;
import 'role.dart' as _i23;
import 'serving.dart' as _i24;
import 'store.dart' as _i25;
import 'tenant.dart' as _i26;
import 'trade/card_type.dart' as _i27;
import 'trainer.dart' as _i28;
import 'user.dart' as _i29;
import 'package:preso_server/src/generated/note.dart' as _i30;
import 'package:preso_server/src/generated/store.dart' as _i31;
import 'package:preso_server/src/generated/tenant.dart' as _i32;
import 'package:preso_server/src/generated/user.dart' as _i33;
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
export 'log.dart';
export 'membership.dart';
export 'note.dart';
export 'op_type.dart';
export 'order.dart';
export 'order_status.dart';
export 'payment_method.dart';
export 'permission.dart';
export 'product.dart';
export 'role.dart';
export 'serving.dart';
export 'store.dart';
export 'tenant.dart';
export 'trade/card_type.dart';
export 'trainer.dart';
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
          name: 'province',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'city',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'district',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
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
      name: 'appointment',
      dartName: 'Appointment',
      schema: 'public',
      module: 'preso',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'appointment_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'trainerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'startTime',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'endTime',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'appointment_fk_0',
          columns: ['userId'],
          referenceTable: 'user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'appointment_fk_1',
          columns: ['trainerId'],
          referenceTable: 'trainer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'appointment_pkey',
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
        ),
        _i2.IndexDefinition(
          indexName: 'appointment_index_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'trainerId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
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
      name: 'card',
      dartName: 'Card',
      schema: 'public',
      module: 'preso',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'card_id_seq\'::regclass)',
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
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'price',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'coverImage',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'duration',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'protocol:CardType?',
        ),
        _i2.ColumnDefinition(
          name: '_storeCardsStoreId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'card_fk_0',
          columns: ['_storeCardsStoreId'],
          referenceTable: 'store',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'card_pkey',
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
      name: 'log',
      dartName: 'Log',
      schema: 'public',
      module: 'preso',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'log_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'tenantId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'operationTime',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createrId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:OpType',
        ),
        _i2.ColumnDefinition(
          name: 'operatee',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'log_fk_0',
          columns: ['createrId'],
          referenceTable: 'user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'log_pkey',
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
      name: 'membership',
      dartName: 'Membership',
      schema: 'public',
      module: 'preso',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'membership_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'storeId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'active',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'membership_fk_0',
          columns: ['userId'],
          referenceTable: 'user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'membership_fk_1',
          columns: ['storeId'],
          referenceTable: 'store',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'membership_pkey',
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
        ),
        _i2.IndexDefinition(
          indexName: 'membership_index_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'storeId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
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
          name: 'price',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'productId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createrId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'paymentMethod',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:PaymentMethod',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:OrderStatus',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'order_fk_0',
          columns: ['productId'],
          referenceTable: 'product',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'order_fk_1',
          columns: ['createrId'],
          referenceTable: 'user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
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
      name: 'product',
      dartName: 'Product',
      schema: 'public',
      module: 'preso',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'product_id_seq\'::regclass)',
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
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'offShelf',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'price',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'storeId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'applicableToAllStores',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'product_fk_0',
          columns: ['storeId'],
          referenceTable: 'store',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'product_pkey',
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
      name: 'serving',
      dartName: 'Serving',
      schema: 'public',
      module: 'preso',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'serving_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'trainerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'storeId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'serving_fk_0',
          columns: ['trainerId'],
          referenceTable: 'trainer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'serving_fk_1',
          columns: ['storeId'],
          referenceTable: 'store',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'serving_pkey',
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
        ),
        _i2.IndexDefinition(
          indexName: 'serving_index_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'trainerId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'storeId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
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
          columnDefault: '1',
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
          columnDefault: '\'\'::text',
        ),
        _i2.ColumnDefinition(
          name: 'addressId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'longitude',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'area',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'businessHours',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'latitude',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'tags',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'services',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'facilities',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'equipments',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'wifi',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
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
      name: 'trainer',
      dartName: 'Trainer',
      schema: 'public',
      module: 'preso',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'trainer_id_seq\'::regclass)',
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
        _i2.ColumnDefinition(
          name: 'gender',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'age',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'headshot',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'photos',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'videos',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'servingCity',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'servingHours',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'classFee',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'phone',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'hotness',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'rating',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
          columnDefault: '0.0',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'trainer_pkey',
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
        _i2.ColumnDefinition(
          name: 'gender',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
          columnDefault: '\'male\'::text',
        ),
        _i2.ColumnDefinition(
          name: 'birthday',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'mobile',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'suspended',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'headshot',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'face',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'asTrainerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
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
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'user_fk_1',
          columns: ['asTrainerId'],
          referenceTable: 'trainer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.cascade,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
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
        ),
        _i2.IndexDefinition(
          indexName: 'user_info_id_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userInfoId',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
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
    if (t == _i5.Appointment) {
      return _i5.Appointment.fromJson(data) as T;
    }
    if (t == _i6.Bargain) {
      return _i6.Bargain.fromJson(data) as T;
    }
    if (t == _i7.Brand) {
      return _i7.Brand.fromJson(data) as T;
    }
    if (t == _i8.Card) {
      return _i8.Card.fromJson(data) as T;
    }
    if (t == _i9.Coupon) {
      return _i9.Coupon.fromJson(data) as T;
    }
    if (t == _i10.DbException) {
      return _i10.DbException.fromJson(data) as T;
    }
    if (t == _i11.ExType) {
      return _i11.ExType.fromJson(data) as T;
    }
    if (t == _i12.Example) {
      return _i12.Example.fromJson(data) as T;
    }
    if (t == _i13.Invoice) {
      return _i13.Invoice.fromJson(data) as T;
    }
    if (t == _i14.Log) {
      return _i14.Log.fromJson(data) as T;
    }
    if (t == _i15.Membership) {
      return _i15.Membership.fromJson(data) as T;
    }
    if (t == _i16.Note) {
      return _i16.Note.fromJson(data) as T;
    }
    if (t == _i17.OpType) {
      return _i17.OpType.fromJson(data) as T;
    }
    if (t == _i18.Order) {
      return _i18.Order.fromJson(data) as T;
    }
    if (t == _i19.OrderStatus) {
      return _i19.OrderStatus.fromJson(data) as T;
    }
    if (t == _i20.PaymentMethod) {
      return _i20.PaymentMethod.fromJson(data) as T;
    }
    if (t == _i21.Permission) {
      return _i21.Permission.fromJson(data) as T;
    }
    if (t == _i22.Product) {
      return _i22.Product.fromJson(data) as T;
    }
    if (t == _i23.Role) {
      return _i23.Role.fromJson(data) as T;
    }
    if (t == _i24.Serving) {
      return _i24.Serving.fromJson(data) as T;
    }
    if (t == _i25.Store) {
      return _i25.Store.fromJson(data) as T;
    }
    if (t == _i26.Tenant) {
      return _i26.Tenant.fromJson(data) as T;
    }
    if (t == _i27.CardType) {
      return _i27.CardType.fromJson(data) as T;
    }
    if (t == _i28.Trainer) {
      return _i28.Trainer.fromJson(data) as T;
    }
    if (t == _i29.User) {
      return _i29.User.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.Address?>()) {
      return (data != null ? _i4.Address.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Appointment?>()) {
      return (data != null ? _i5.Appointment.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Bargain?>()) {
      return (data != null ? _i6.Bargain.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Brand?>()) {
      return (data != null ? _i7.Brand.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Card?>()) {
      return (data != null ? _i8.Card.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Coupon?>()) {
      return (data != null ? _i9.Coupon.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.DbException?>()) {
      return (data != null ? _i10.DbException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.ExType?>()) {
      return (data != null ? _i11.ExType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.Example?>()) {
      return (data != null ? _i12.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.Invoice?>()) {
      return (data != null ? _i13.Invoice.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.Log?>()) {
      return (data != null ? _i14.Log.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.Membership?>()) {
      return (data != null ? _i15.Membership.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.Note?>()) {
      return (data != null ? _i16.Note.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.OpType?>()) {
      return (data != null ? _i17.OpType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.Order?>()) {
      return (data != null ? _i18.Order.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.OrderStatus?>()) {
      return (data != null ? _i19.OrderStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.PaymentMethod?>()) {
      return (data != null ? _i20.PaymentMethod.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.Permission?>()) {
      return (data != null ? _i21.Permission.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.Product?>()) {
      return (data != null ? _i22.Product.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.Role?>()) {
      return (data != null ? _i23.Role.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.Serving?>()) {
      return (data != null ? _i24.Serving.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.Store?>()) {
      return (data != null ? _i25.Store.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.Tenant?>()) {
      return (data != null ? _i26.Tenant.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.CardType?>()) {
      return (data != null ? _i27.CardType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.Trainer?>()) {
      return (data != null ? _i28.Trainer.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.User?>()) {
      return (data != null ? _i29.User.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i8.Card>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i8.Card>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i24.Serving>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i24.Serving>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i15.Membership>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i15.Membership>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i24.Serving>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i24.Serving>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i5.Appointment>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i5.Appointment>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i5.Appointment>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i5.Appointment>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i15.Membership>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i15.Membership>(e)).toList()
          : null) as T;
    }
    if (t == List<_i30.Note>) {
      return (data as List).map((e) => deserialize<_i30.Note>(e)).toList() as T;
    }
    if (t == List<_i31.Store>) {
      return (data as List).map((e) => deserialize<_i31.Store>(e)).toList()
          as T;
    }
    if (t == List<_i32.Tenant>) {
      return (data as List).map((e) => deserialize<_i32.Tenant>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i33.User>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i33.User>(e)).toList()
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
    if (data is _i5.Appointment) {
      return 'Appointment';
    }
    if (data is _i6.Bargain) {
      return 'Bargain';
    }
    if (data is _i7.Brand) {
      return 'Brand';
    }
    if (data is _i8.Card) {
      return 'Card';
    }
    if (data is _i9.Coupon) {
      return 'Coupon';
    }
    if (data is _i10.DbException) {
      return 'DbException';
    }
    if (data is _i11.ExType) {
      return 'ExType';
    }
    if (data is _i12.Example) {
      return 'Example';
    }
    if (data is _i13.Invoice) {
      return 'Invoice';
    }
    if (data is _i14.Log) {
      return 'Log';
    }
    if (data is _i15.Membership) {
      return 'Membership';
    }
    if (data is _i16.Note) {
      return 'Note';
    }
    if (data is _i17.OpType) {
      return 'OpType';
    }
    if (data is _i18.Order) {
      return 'Order';
    }
    if (data is _i19.OrderStatus) {
      return 'OrderStatus';
    }
    if (data is _i20.PaymentMethod) {
      return 'PaymentMethod';
    }
    if (data is _i21.Permission) {
      return 'Permission';
    }
    if (data is _i22.Product) {
      return 'Product';
    }
    if (data is _i23.Role) {
      return 'Role';
    }
    if (data is _i24.Serving) {
      return 'Serving';
    }
    if (data is _i25.Store) {
      return 'Store';
    }
    if (data is _i26.Tenant) {
      return 'Tenant';
    }
    if (data is _i27.CardType) {
      return 'CardType';
    }
    if (data is _i28.Trainer) {
      return 'Trainer';
    }
    if (data is _i29.User) {
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
    if (dataClassName == 'Appointment') {
      return deserialize<_i5.Appointment>(data['data']);
    }
    if (dataClassName == 'Bargain') {
      return deserialize<_i6.Bargain>(data['data']);
    }
    if (dataClassName == 'Brand') {
      return deserialize<_i7.Brand>(data['data']);
    }
    if (dataClassName == 'Card') {
      return deserialize<_i8.Card>(data['data']);
    }
    if (dataClassName == 'Coupon') {
      return deserialize<_i9.Coupon>(data['data']);
    }
    if (dataClassName == 'DbException') {
      return deserialize<_i10.DbException>(data['data']);
    }
    if (dataClassName == 'ExType') {
      return deserialize<_i11.ExType>(data['data']);
    }
    if (dataClassName == 'Example') {
      return deserialize<_i12.Example>(data['data']);
    }
    if (dataClassName == 'Invoice') {
      return deserialize<_i13.Invoice>(data['data']);
    }
    if (dataClassName == 'Log') {
      return deserialize<_i14.Log>(data['data']);
    }
    if (dataClassName == 'Membership') {
      return deserialize<_i15.Membership>(data['data']);
    }
    if (dataClassName == 'Note') {
      return deserialize<_i16.Note>(data['data']);
    }
    if (dataClassName == 'OpType') {
      return deserialize<_i17.OpType>(data['data']);
    }
    if (dataClassName == 'Order') {
      return deserialize<_i18.Order>(data['data']);
    }
    if (dataClassName == 'OrderStatus') {
      return deserialize<_i19.OrderStatus>(data['data']);
    }
    if (dataClassName == 'PaymentMethod') {
      return deserialize<_i20.PaymentMethod>(data['data']);
    }
    if (dataClassName == 'Permission') {
      return deserialize<_i21.Permission>(data['data']);
    }
    if (dataClassName == 'Product') {
      return deserialize<_i22.Product>(data['data']);
    }
    if (dataClassName == 'Role') {
      return deserialize<_i23.Role>(data['data']);
    }
    if (dataClassName == 'Serving') {
      return deserialize<_i24.Serving>(data['data']);
    }
    if (dataClassName == 'Store') {
      return deserialize<_i25.Store>(data['data']);
    }
    if (dataClassName == 'Tenant') {
      return deserialize<_i26.Tenant>(data['data']);
    }
    if (dataClassName == 'CardType') {
      return deserialize<_i27.CardType>(data['data']);
    }
    if (dataClassName == 'Trainer') {
      return deserialize<_i28.Trainer>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i29.User>(data['data']);
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
      case _i5.Appointment:
        return _i5.Appointment.t;
      case _i6.Bargain:
        return _i6.Bargain.t;
      case _i7.Brand:
        return _i7.Brand.t;
      case _i8.Card:
        return _i8.Card.t;
      case _i9.Coupon:
        return _i9.Coupon.t;
      case _i13.Invoice:
        return _i13.Invoice.t;
      case _i14.Log:
        return _i14.Log.t;
      case _i15.Membership:
        return _i15.Membership.t;
      case _i16.Note:
        return _i16.Note.t;
      case _i18.Order:
        return _i18.Order.t;
      case _i21.Permission:
        return _i21.Permission.t;
      case _i22.Product:
        return _i22.Product.t;
      case _i23.Role:
        return _i23.Role.t;
      case _i24.Serving:
        return _i24.Serving.t;
      case _i25.Store:
        return _i25.Store.t;
      case _i26.Tenant:
        return _i26.Tenant.t;
      case _i28.Trainer:
        return _i28.Trainer.t;
      case _i29.User:
        return _i29.User.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'preso';
}
