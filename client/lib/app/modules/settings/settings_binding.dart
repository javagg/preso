import 'package:get/get.dart';

import 'settings_controller.dart';

class SettingsBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<SettingsController>(
        () => SettingsController(),
      )
    ];
  }
}
