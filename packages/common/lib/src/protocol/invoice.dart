/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

part of 'tenantable.dart';

abstract class Invoice extends _i1.Tenantable implements _i2.SerializableModel {
  Invoice._({
    this.id,
    required super.tenantId,
    required this.name,
  });

  factory Invoice({
    int? id,
    required int tenantId,
    required String name,
  }) = _InvoiceImpl;

  factory Invoice.fromJson(Map<String, dynamic> jsonSerialization) {
    return Invoice(
      id: jsonSerialization['id'] as int?,
      tenantId: jsonSerialization['tenantId'] as int,
      name: jsonSerialization['name'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  /// Returns a shallow copy of this [Invoice]
  /// with some or all fields replaced by the given arguments.
  @_i2.useResult
  Invoice copyWith({
    int? id,
    int? tenantId,
    String? name,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'tenantId': tenantId,
      'name': name,
    };
  }

  @override
  String toString() {
    return _i2.SerializationManager.encode(this);
  }
}

class _InvoiceImpl extends Invoice {
  _InvoiceImpl({
    int? id,
    required int tenantId,
    required String name,
  }) : super._(
          id: id,
          tenantId: tenantId,
          name: name,
        );

  /// Returns a shallow copy of this [Invoice]
  /// with some or all fields replaced by the given arguments.
  @_i2.useResult
  @override
  Invoice copyWith({
    Object? id = _Undefined,
    int? tenantId,
    String? name,
  }) {
    return Invoice(
      id: id is int? ? id : this.id,
      tenantId: tenantId ?? this.tenantId,
      name: name ?? this.name,
    );
  }
}
