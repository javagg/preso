import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;
import 'tencent_map_interop.dart';

// @JS()
// class Map {
//   external factory Map(web.HTMLElement container, MapOptions options);
//   external setCenter(LatLng latlng);
//   external setZoom(num zoom);
// }

// @JS()
// @anonymous
// class MapOptions {
//   external factory MapOptions({
//     LatLng? center,
//     num? zoom,
//     bool? disableDefaultUI,
//   });

//   external LatLng? get center;
//   external num? get zoom;
//   external bool? get disableDefaultUI;
// }

// @JS()
// class LatLng {
//   external factory LatLng(num lat, num lng);
//   external num get lat;
//   external num get lng;
// }

// @JS()
// class Marker {
//   external factory Marker(MarkerOptions options);
//   external setMap(Map? map);
// }

// @JS()
// @anonymous
// class MarkerOptions {
//   external factory MarkerOptions({
//     LatLng? position,
//     Map? map,
//     String? title,
//   });

//   external LatLng? get position;
//   external Map? get map;
//   external String? get title;
// }

// @JS()
// class Polyline {
//   external factory Polyline(PolylineOptions options);
//   external setMap(Map? map);
// }

// @JS()
// @anonymous
// class PolylineOptions {
//   external factory PolylineOptions({
//     List<LatLng>? path,
//     Map? map,
//     String? strokeColor,
//     num? strokeWeight,
//     num? strokeOpacity,
//   });

//   external List<LatLng>? get path;
//   external Map? get map;
//   external String? get strokeColor;
//   external num? get strokeWeight;
//   external num? get strokeOpacity;
// }

// // 使用
// void _addPolyline(List<LatLng> path) {
//   final polyline = Polyline(
//     PolylineOptions(
//       path: path,
//       map: _map,
//       strokeColor: '#FF0000',
//       strokeWeight: 3,
//       strokeOpacity: 0.7,
//     ),
//   );
// }

class TencentMap extends StatefulWidget {
  final double width;
  final double height;
  final LatLng center;
  final double zoom;
  final bool interactive;
  final void Function(LatLng)? onTap;

  const TencentMap({
    super.key,
    required this.width,
    required this.height,
    required this.center,
    this.zoom = 15,
    this.interactive = true,
    this.onTap,
  });

  @override
  State<TencentMap> createState() => _TencentMapState();
}

class _TencentMapState extends State<TencentMap> {
  Map? _map;

  // @override
  // void didUpdateWidget(covariant TencentMap oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   if (_map != null) {
  //     if (widget.center.lat != oldWidget.center.lat ||
  //         widget.center.lng != oldWidget.center.lng) {
  //       _map!.setCenter(widget.center);
  //     }
  //     if (widget.zoom != oldWidget.zoom) {
  //       _map!.setZoom(widget.zoom);
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: HtmlElementView(
        viewType: 'tencent-map',
        onPlatformViewCreated: _initMap,
        creationParams: <String, Object?>{
          'key': 'someValue',
        },
      ),
    );
  }

  void _initMap(int id) {
    Future.delayed(Duration.zero, () {
      final element = web.document.getElementById('tencent-map-$id');
      if (element != null) {
        // element.append(_container);
        // _initializeMap();
        _map = Map(
          'tencent-map-$id', null,
          // MapOptions(
          //     //   // center: widget.center,
          //     //   // zoom: widget.zoom,
          //     //   // disableDefaultUI: !widget.interactive,
          //     ),
        );
      }
    });
  }

  void _initializeMap() {
    // 添加初始标记
    // _addMarker(widget.center);

    // 添加点击事件
    // if (widget.onTap != null) {
    //   _container.onClick.listen((event) {
    //     // 这里需要更精确的坐标转换逻辑
    //     widget.onTap!(widget.center);
    //   });
    // }
  }

  // void _addMarker(LatLng position) {
  //   final marker = Marker(
  //     MarkerOptions(
  //       position: position,
  //       map: _map,
  //       title: '当前位置',
  //     ),
  //   );
  // }

  // void _addMapListeners() {
  //   // 使用 js_interop 添加原生事件监听
  //   final map = _map!;

  //   // 点击事件
  //   // map.addListener('click', allowInterop((event) {
  //   //   final lat = event.latLng.lat;
  //   //   final lng = event.latLng.lng;
  //   //   if (widget.onTap != null) {
  //   //     widget.onTap!(LatLng(lat, lng));
  //   //   }
  //   // }));

  //   // // 缩放变化事件
  //   // map.addListener('zoom_changed', allowInterop(() {
  //   //   final zoom = map.getZoom();
  //   //   // 处理缩放变化
  //   // }));
  // }

  // void _addMarkers(List<LatLng> positions) {
  //   for (final position in positions) {
  //     final marker = Marker(
  //       MarkerOptions(
  //         position: position,
  //         map: _map,
  //         title: '标记点',
  //       ),
  //     );
  //   }
  // }

  @override
  void dispose() {
    _map = null;
    super.dispose();
  }
}
