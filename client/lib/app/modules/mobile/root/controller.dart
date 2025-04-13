import 'package:get/get.dart';
import 'package:preso_common/preso_common.dart';
import '../../../../serverpod_client.dart' as pod;

class RootController extends GetxController {
  var tabIndex = 0.obs;

  // var store = null.obs;

  var trainers = [
    Trainer(
        name: "trainer",
        description: "ppapaaap",
        gender: "male",
        age: 20,
        headshot: "",
        photos: "",
        videos: "",
        servingCity: "",
        servingHours: "",
        classFee: 199,
        phone: "110")
  ].obs;

  void changePage(int index) {
    tabIndex.value = index;
  }

  var items = List<String>.generate(20, (index) => 'Item ${index + 1}').obs;

  @override
  void onReady() {}

  Future init() async {
    var storeId = 1;
    var tenants = await pod.client.store.get(storeId);
  }

  final List<String> imageUrls = [
    'https://picsum.photos/id/10/800/600',
    'https://picsum.photos/id/11/800/600',
    'https://picsum.photos/id/12/800/600',
    'https://picsum.photos/id/13/800/600',
    'https://picsum.photos/id/14/800/600',
  ];
}

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
