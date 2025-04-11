import 'dart:math';

double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
  var p = 0.017453292519943295;
  var c = cos as double Function(num?);
  var a = 0.5 -
      c((lat2 - lat1) * p) / 2 +
      c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
  return 12742 * 1000 * asin(sqrt(a));
}

String formatDistance(double distance) {
  if (distance > 1000) {
    distance = distance / 1000;
    return "${(distance).toStringAsFixed(
            distance.truncateToDouble() == distance ? 0 : 2)} km";
  } else {
    return "${distance.floor()} m";
  }
}