import 'package:get/get.dart';

class StoreController extends GetxController {
  var loading = false.obs;

  var page = 0.obs;
  var limit = 10.obs;

  @override
  void onInit() {
    super.onInit();
    fetchEmployees();
  }

  void previousPage() {
    if (page > 0) {
      page(page.value - 1);
    }
  }

  void nextPage() {
    if ((page.value + 1) * limit.value < employees.length) {
      page(page.value + 1);
    }
  }
}
