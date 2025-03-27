import 'package:serverpod/serverpod.dart';
import '../generated/tenant.dart';
import '../services/tenant.dart';

class TenantEndpoint extends Endpoint {
  Future<List<Tenant>> all(Session session) async {
    return await tenantService.list();
  }
}
