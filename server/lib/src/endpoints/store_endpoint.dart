import 'package:serverpod/serverpod.dart';
import '../generated/store.dart';

class StoreEndpoint extends Endpoint {
  Future<List<Store>> all(Session session) async {
    return await Store.db.find(session);
  }

  Future<Store?> get(Session session) async {
    return await Store.db.findById(session, 1);
  }
}
