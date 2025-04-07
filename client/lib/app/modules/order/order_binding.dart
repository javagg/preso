import 'package:get/get.dart';

import 'order_controller.dart';

class OrderBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<OrderViewController>(
        () => OrderViewController(),
      )
    ];
  }
}
