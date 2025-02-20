library;

import 'dart:js_interop';
import 'package:web/web.dart';

@JS('CallbackResult')
extension type CallbackResult._(JSObject _) implements JSObject {
  external String get errMsg;
}

@JS('Taro')
class Taro {
  external static void showToast(JSObject options);
  external static void navigateTo(JSObject options);
  external static void redirectTo(JSObject options);
  external static void switchTab(JSObject options);
  external static void navigateBack(JSObject options);
  external static void reLaunch(JSObject options);
 
  external static void showModal(JSObject options);
   external static void showLoading(JSObject options);
   external static void hideLoading();
     external static void setStorage(JSObject options);
   external static void getStorage(JSObject options);
   external static void removeStorage(JSObject options);
     external static void getSystemInfo(JSObject options);


       external static void request(JSObject options);
}