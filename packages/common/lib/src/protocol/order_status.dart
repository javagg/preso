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

enum OrderStatus implements _i1.SerializableModel {
  canceled,
  paid,
  refunded,
  unpaid;

  static OrderStatus fromJson(String name) {
    switch (name) {
      case 'canceled':
        return OrderStatus.canceled;
      case 'paid':
        return OrderStatus.paid;
      case 'refunded':
        return OrderStatus.refunded;
      case 'unpaid':
        return OrderStatus.unpaid;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "OrderStatus"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
