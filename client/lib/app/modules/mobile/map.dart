import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preso_client/helpers/geo.dart';
import 'package:preso_common/preso_common.dart';
import 'package:web/web.dart' as web;

import '../../../tencent_map.dart';
import '../../../tencent_map_interop.dart';

class MapController extends GetxController {
  dynamic map;
  final distance = "0.0 km".obs;

  @override
  void onInit() {
    super.onInit();
    calculateDis();
  }

  Future<void> calculateDis() async {
    var store = Get.arguments as Store;
    var (lat1, lon1) = await fetchCurrentLocation();
    var (lat2, lon2) = (store.latitude, store.longitude);
    distance.value = formatDistance(calculateDistance(lat1, lon1, lat2, lon2));
  }
}

class MapBinding implements Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<MapController>(
        () => MapController(),
      )
    ];
  }
}

class MapView extends GetView<MapController> {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    var store = Get.arguments as Store;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: TencentMap(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 200,
              center: LatLng(39.9042, 116.4074),
              zoom: 15,
              onTap: (position) {},
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ListTile(
                    title: Text(store.name),
                    subtitle: Text("洪山区关山大道300号"),
                    trailing: Obx(
                      () {
                        return Text(
                          controller.distance.value,
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Called after `element` is attached to the DOM.
void onElementAttached(web.HTMLDivElement element) {
  final web.Element? located =
      web.document.querySelector('#someIdThatICanFindLater');
  assert(located == element, 'Wrong `element` located!');
  // Do things with `element` or `located`, or call your code now...
  element.style.backgroundColor = 'green';
}

void onElementCreated(Object element) {
  element as web.HTMLDivElement;
  element.style.backgroundColor = 'red';
  element.id = 'someIdThatICanFindLater';

  final web.ResizeObserver observer = web.ResizeObserver((
    JSArray<web.ResizeObserverEntry> entries,
    web.ResizeObserver observer,
  ) {
    if (element.isConnected) {
      // The observer is done, disconnect it.
      observer.disconnect();
      // Call our callback.
      onElementAttached(element);
    }
  }.toJS);

  // Connect the observer.
  observer.observe(element);
}
