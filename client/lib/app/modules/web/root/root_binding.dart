import 'package:get/get.dart';

import 'root_controller.dart';

class RootBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<RootController>(
        () => RootController(),
      )
    ];
  }
}
