import 'package:get/get.dart';

import 'tenant_controller.dart';

class TenantBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<TenantController>(
        () => TenantController(),
      )
    ];
  }
}
