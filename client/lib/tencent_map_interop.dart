@JS('TMap')
library;

import 'dart:js_interop';

extension type LatLng._(JSObject _) implements JSObject {
  external LatLng(num lat, num lng);
  external num get lat;
  external num get lng;
}

extension type MapOptions._(JSObject _) implements JSObject {
  external MapOptions();
}

extension type Map._(JSObject _) implements JSObject {
  external Map(String id, MapOptions? options);
}
