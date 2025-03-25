library;

import 'dart:js_interop';
// ignore: deprecated_member_use
import 'dart:js_util';

import 'package:web/web.dart';
import 'dart:async';

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

@JS()
class Promise<T> {}

@JS()
class SuccessCallbackResult {}


@JS('Taro.scanCode')
external Promise<SuccessCallbackResult> _scanCode(JSObject options);

@JS('Taro.chooseImage')
external Promise<SuccessCallbackResult> _chooseImage(JSObject options);


@JS('Taro.chooseImage')
external Promise<CallbackResult> _requestPayment(JSObject options);

@JS('Taro.getLocation')
external Promise<SuccessCallbackResult> _getLocation(JSObject options);
 

Future scanCode(JSObject options) async =>
    await promiseToFuture(_scanCode(options));

Future chooseImage(JSObject options) async =>
    await promiseToFuture(_chooseImage(options));

Future requestPayment(JSObject options) async =>
    await promiseToFuture(_requestPayment(options));

Future getLocation(JSObject options) async =>
    await promiseToFuture(_getLocation(options));