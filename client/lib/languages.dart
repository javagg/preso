import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Languages extends Translations {
  Languages._() : data = {};

  Map<String, Map<String, String>> data;

  static Languages get instance => _instance ??= Languages._();

  static Languages? _instance;

  Future<void> init() async {
    for (String locale in ["en_US", "zh_CN"]) {
      final content =
          await rootBundle.loadString('assets/locales/$locale.json');
      var json = jsonDecode(content);
      data[locale] = allJsonPaths(json);
    }
  }

  @override
  Map<String, Map<String, String>> get keys => data;
}

Map<String, String> allJsonPaths(dynamic json, [String currentPath = r'']) {
  final result = <String, String>{};
  if (json is Map) {
    json.forEach((key, value) {
      final newPath = currentPath.isEmpty ? '$key' : '$currentPath.$key';
      if (value is Map || value is List) {
        result.addAll(allJsonPaths(value, newPath));
      } else {
        result[newPath] = value as String;
      }
    });
  } else if (json is List) {
    for (var i = 0; i < json.length; i++) {
      final newPath = '$currentPath[$i]';
      if (json[i] is Map || json[i] is List) {
        result.addAll(allJsonPaths(json[i], newPath));
      } else {
        result[newPath] = json[i] as String;
      }
    }
  } else {
    result[currentPath] = json as String;
  }
  return result;
}
