import 'dart:ui_web' as ui_web;
import 'package:web/web.dart' as web;

void registerRedDivFactory() {
  ui_web.platformViewRegistry.registerViewFactory(
    'tencent-map',
    (int viewId, {Object? params}) => web.HTMLDivElement()
      ..id = 'tencent-map-$viewId'
      // ..style.backgroundColor = 'red'
      ..style.width = '100%'
      ..style.height = '100%',
  );
}
