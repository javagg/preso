import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

class StoreEndpoint extends Endpoint {
  Future<List<Store>> all(Session session) async {
    return await Store.db.find(session);
  }

  Future<Store?> get(Session session, int id) async {
    return await Store.db.findById(session, id);
  }
}
