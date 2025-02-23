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

abstract class Order implements _i1.SerializableModel {
  Order._({required this.no});

  factory Order({required int no}) = _OrderImpl;

  factory Order.fromJson(Map<String, dynamic> jsonSerialization) {
    return Order(no: jsonSerialization['no'] as int);
  }

  int no;

  Order copyWith({int? no});
  @override
  Map<String, dynamic> toJson() {
    return {'no': no};
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _OrderImpl extends Order {
  _OrderImpl({required int no}) : super._(no: no);

  @override
  Order copyWith({int? no}) {
    return Order(no: no ?? this.no);
  }
}
