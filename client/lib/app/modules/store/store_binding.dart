import 'package:get/get.dart';

import 'store_controller.dart';

class StoreBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<StoreController>(
        () => StoreController(),
      )
    ];
  }
}
