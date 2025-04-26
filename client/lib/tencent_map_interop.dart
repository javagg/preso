@JS()
library tencent_map_interop;

import 'package:js/js.dart';
import 'package:web/web.dart' as web;

// 腾讯地图全局对象
@JS('TMap')
external dynamic get tmap;

// 地图类
@JS()
class Map {
  external factory Map(web.HTMLElement container, MapOptions options);
  external setCenter(LatLng latlng);
  external setZoom(num zoom);
}

// 地图选项
@JS()
@anonymous
class MapOptions {
  external factory MapOptions({
    LatLng? center,
    num? zoom,
    bool? disableDefaultUI,
  });

  external LatLng? get center;
  external num? get zoom;
  external bool? get disableDefaultUI;
}

// 经纬度类
@JS()
class LatLng {
  external factory LatLng(num lat, num lng);
  external num get lat;
  external num get lng;
}

// 标记类
@JS()
class Marker {
  external factory Marker(MarkerOptions options);
  external setMap(Map? map);
}

// 标记选项
@JS()
@anonymous
class MarkerOptions {
  external factory MarkerOptions({
    LatLng? position,
    Map? map,
    String? title,
  });

  external LatLng? get position;
  external Map? get map;
  external String? get title;
}

@JS()
class Polyline {
  external factory Polyline(PolylineOptions options);
  external setMap(Map? map);
}

@JS()
@anonymous
class PolylineOptions {
  external factory PolylineOptions({
    List<LatLng>? path,
    Map? map,
    String? strokeColor,
    num? strokeWeight,
    num? strokeOpacity,
  });

  external List<LatLng>? get path;
  external Map? get map;
  external String? get strokeColor;
  external num? get strokeWeight;
  external num? get strokeOpacity;
}

// 使用
void _addPolyline(List<LatLng> path) {
  final polyline = Polyline(
    PolylineOptions(
      path: path,
      map: _map,
      strokeColor: '#FF0000',
      strokeWeight: 3,
      strokeOpacity: 0.7,
    ),
  );
}
