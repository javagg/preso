import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web/web.dart' as web;

import '../../../tencent_map.dart';
import '../../../tencent_map_interop.dart';

class MapController extends GetxController {
  // 地图实例
  dynamic map;

  // LatLng _center = LatLng(39.9042, 116.4074);
  // double _zoom = 15;
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
    return Scaffold(
      appBar: AppBar(
        title: Text('地图'),
      ),
      // body: Text("map")
      // body: Center(
      //   child: const HtmlElementView(
      //     viewType: 'tencent-map',
      //     // onPlatformViewCreated: myOnPlatformViewCreated,
      //     creationParams: <String, Object?>{
      //       'key': 'someValue',
      //     },
      //   ),
      // ),
      body: Column(
        children: [
          Expanded(
            child: TencentMap(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 200,
              center: LatLng(39.9042, 116.4074), zoom: 15, onTap: (position) {},
              // center: _center,
              // zoom: _zoom,
              // onTap: (position) {
              //   setState(() {
              //     _center = position;
              //   });
              // },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            // child: Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     ElevatedButton(
            //       onPressed: () => setState(() => _zoom++),
            //       child: const Text('放大'),
            //     ),
            //     ElevatedButton(
            //       onPressed: () => setState(() => _zoom--),
            //       child: const Text('缩小'),
            //     ),
            //     Text('纬度: ${_center.lat.toStringAsFixed(4)}'),
            //     Text('经度: ${_center.lng.toStringAsFixed(4)}'),
            //   ],
            // ),
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
