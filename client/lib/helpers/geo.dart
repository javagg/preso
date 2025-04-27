import 'dart:math';

import 'package:geolocator/geolocator.dart';

// in meters
double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
  var p = 0.017453292519943295;
  // var c = cos as double Function(num?);
  var a = 0.5 -
      cos((lat2 - lat1) * p) / 2 +
      cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
  return 12742 * asin(sqrt(a));
}

String formatDistance(double distance) {
  if (distance > 1000) {
    distance = distance / 1000;
    return "${(distance).toStringAsFixed(distance.truncateToDouble() == distance ? 0 : 2)} km";
  } else {
    return "${distance.floor()} m";
  }
}

Future<(double, double)> fetchCurrentLocation() async {
  try {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are denied');
    }

    Position position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings());
    return (position.latitude, position.longitude);
  } catch (e) {
    throw Exception('Error getting location: $e');
  }
}
