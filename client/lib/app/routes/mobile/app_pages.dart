import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../middleware/auth_middleware.dart';
import '../../modules/login/login_view.dart';
import '../../modules/mobile/map.dart';
import '../../modules/mobile/root.dart';

import '../app_routes.dart';
export '../app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.root;

  static final routes = [
    GetPage(
      name: '/',
      page: () => RootView(),
      bindings: [RootBinding()],
      participatesInRootNavigator: true,
      preventDuplicates: true,
    ),
    GetPage(
      middlewares: [
        //only enter this route when not authed
        EnsureNotAuthedMiddleware(),
      ],
      name: Paths.login,
      page: () => const LoginView(),
      participatesInRootNavigator: true,
      bindings: [LoginBinding()],
    ),
    GetPage(
      transition: Transition.noTransition,
      participatesInRootNavigator: true,
      name: "/map",
      page: () => MapView(),
      // bindings: [LoginBinding()],
    )
  ];
}

class MainMiddleware extends GetMiddleware {
  @override
  void onPageDispose() {
    log('MainMiddleware onPageDispose');
    super.onPageDispose();
  }

  @override
  Widget onPageBuilt(Widget page) {
    log('MainMiddleware onPageBuilt');
    return super.onPageBuilt(page);
  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    log('MainMiddleware onPageCalled for route: ${page?.name}');
    return super.onPageCalled(page);
  }

  @override
  List<R>? onBindingsStart<R>(List<R>? bindings) {
    log('MainMiddleware onBindingsStart');
    return super.onBindingsStart(bindings);
  }

  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    log('MainMiddleware onPageBuildStart');

    return super.onPageBuildStart(page);
  }
}
