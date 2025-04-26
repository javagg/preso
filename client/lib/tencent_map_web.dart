import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:web/web.dart' as web;

class TencentMapWeb {
  static void registerWith(Registrar registrar) {
    registrar.registerViewFactory(
      'tencent-map',
      (int viewId) => web.DivElement()
        ..id = 'tencent-map-$viewId'
        ..style.width = '100%'
        ..style.height = '100%',
    );
  }
}