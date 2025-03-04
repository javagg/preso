import 'dart:async';
import 'dart:js_interop';

import 'package:web/web.dart' as web;

class WechatSignInWebService {
  final String clientId;
  final List<String> scopes;
  final String redirectUri;
  _SignInSession? _signInSession;

  WechatSignInWebService({
    required this.clientId,
    required this.scopes,
    required this.redirectUri,
  }) {
    web.window.addEventListener('message', _eventListener.toJS);
  }

  void _eventListener(web.Event event) {
    var messageEvent = event as web.MessageEvent;
    var jsString = messageEvent.data as JSString;
    var code = jsString.toDart;
    _signInSession?.completeWithCode(code);
  }

  Future<String?> signIn() async {
    if (_signInSession != null) {
      return null;
    }

    var authorizationUri = Uri(
      scheme: 'https',
      host: 'open.weixin.qq.com',
      path: '/connect/qrconnect',
      fragment: 'wechat',
      queryParameters: {
        'appid': "wx268fcfe924dcb171",
        'scope': 'snsapi_login', // scopes.join(' '),
        'response_type': 'code',
        'redirect_uri': redirectUri,
        // 'client_id': clientId,
        // 'access_type': 'offline',
        // 'prompt': 'select_account consent',
      },
    );

    // Builds the Google authentication uri.
    // See: https://developers.google.com/identity/protocols/oauth2/web-server
    // var authorizationUri = Uri(
    //   scheme: 'https',
    //   host: 'accounts.google.com',
    //   path: '/o/oauth2/v2/auth',
    //   queryParameters: {
    //     'scope': scopes.join(' '),
    //     'response_type': 'code',
    //     'redirect_uri': redirectUri,
    //     'client_id': clientId,
    //     'access_type': 'offline',
    //     'prompt': 'select_account consent',
    //   },
    // );

    // Creates a sign-in session, opens the authentication window and signs and
    // waits for a callback from the opened page.
    _signInSession = _SignInSession(authorizationUri.toString());
    var code = await _signInSession!.codeCompleter.future;
    _signInSession = null;
    return code;
  }
}

class _SignInSession {
  final codeCompleter = Completer<String?>();
  late final web.Window _window;
  late final Timer _timer;

  bool get isClosed => codeCompleter.isCompleted;

  _SignInSession(String authorizationUri) {
    // Opens the Google authentication url in a new window. When the
    // authentication is complete on the client side the window is redirected to.
    // This page will then make a callback into Flutter with the retrieved
    // server authentication code.
    var window = web.window.open(
      authorizationUri,
      '_blank',
      'location=yes,width=550,height=600',
    );

    // If the window could not be opened, we can't sign in.
    if (window == null) {
      codeCompleter.complete(null);
      return;
    }

    _window = window;

    // Monitors the window, if it's closed without signing in, make the
    // completer return null.
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (_window.closed == true) {
        if (!isClosed) {
          codeCompleter.complete(null);
        }
        _timer.cancel();
      }
    });
  }

  // Called when we receive the code from open window.
  void completeWithCode(String code) {
    if (!isClosed) {
      codeCompleter.complete(code);
    }
  }
}
