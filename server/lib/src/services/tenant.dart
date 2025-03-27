import '../generated/tenant.dart';

class TanentService {
  const TanentService();

  Future<List<Tenant>> list() async {
    return [];
  }

  Future<Tenant?> get(int id) async {
    return null;
  }
}

const tenantService = TanentService();
