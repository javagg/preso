import 'package:get/get.dart';
import 'package:preso_client/app/modules/mobile/root.dart';

class RootController extends GetxController {
  var tabIndex = 0.obs;
  void changePage(int index) {
    tabIndex.value = index;
  }
}

class RootBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<RootController>(
        () => RootController(),
      ),
      Bind.lazyPut<MyPageController>(
        () => MyPageController(),
      ),
      Bind.lazyPut<HomePageController>(
        () => HomePageController(),
      ),
      Bind.lazyPut<AppointmentPageController>(
        () => AppointmentPageController(),
      ),
    ];
  }
}
