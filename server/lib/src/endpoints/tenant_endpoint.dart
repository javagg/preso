import 'package:serverpod/serverpod.dart';
import '../generated/tenant.dart';

class TenantEndpoint extends Endpoint {
  Future<List<Tenant>> all(Session session, int? limit, int? offset) async {
    return await Tenant.db.find(
      session,
      limit: limit,
      offset: offset,
    );
  }

  Future<Tenant?> get(Session session, int id) async {
    var tenants = await Tenant.db.find(
      session,
      where: (r) => r.id.equals(id),
    );
    return tenants.firstOrNull;
  }

  Future<void> update(Session session, Tenant tenant) async {
    await Tenant.db.update(session, [tenant]);
  }

  Future<void> create(Session session, Tenant tenant) async {
    await Tenant.db.insert(session, [tenant]);
  }

  Future<void> delete(Session session, Tenant tenant) async {
    await Tenant.db.deleteRow(session, tenant);
  }
}