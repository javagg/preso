import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Languages extends Translations {
  Languages._() : data = {};

  Map<String, dynamic> data;

  static Languages get instance => _instance ??= Languages._();

  static Languages? _instance;

  Future<void> init() async {
    for (String locale in ["en_US", "zh_CN"]) {
      final content =
          await rootBundle.loadString('assets/locales/$locale.json');
      data[locale] = jsonDecode(content);
    }
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          "title": "Preso",
          'greeting': 'Hello',
          "dashboard": "Dashboard",
        },
        'zh_CN': {
          "title": "怪兽",
          'greeting': '你好',
          'dashboard': '仪表盘',
        },
      };
}
