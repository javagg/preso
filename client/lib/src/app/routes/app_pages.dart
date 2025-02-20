import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../middleware/auth_middleware.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/product_details/bindings/product_details_binding.dart';
import '../modules/product_details/views/product_details_view.dart';
import '../modules/products/bindings/products_binding.dart';
import '../modules/products/views/products_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/root/bindings/root_binding.dart';
import '../modules/root/views/root_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      middlewares: [
        //only enter this route when not authed
        EnsureNotAuthedMiddleware(),
      ],
      name: _Paths.login,
      page: () => const LoginView(),
      bindings: [LoginBinding()],
    ),
    GetPage(
      name: '/',
      page: () => const RootView(),
      middlewares: [
        // EnsureAuthMiddleware(),
      ],
      bindings: [RootBinding()],
      participatesInRootNavigator: true,
      preventDuplicates: true,
      children: [
        // GetPage(
        //   middlewares: [
        //     //only enter this route when not authed
        //     EnsureNotAuthedMiddleware(),
        //   ],
        //   name: _Paths.login,
        //   page: () => const LoginView(),
        //   bindings: [LoginBinding()],
        // ),
        GetPage(
          name: _Paths.dashboard,
          page: () => const DashboardView(),
          bindings: [
            DashboardBinding(),
          ],
          transition: Transition.noTransition,
        ),
        // GetPage(
        //   preventDuplicates: true,
        //   name: _Paths.home,
        //   page: () => const HomeView(),
        //   bindings: [
        //     HomeBinding(),
        //   ],
        //   title: null,
        //   children: [
        //     GetPage(
        //       middlewares: [
        //         //only enter this route when authed
        //         EnsureAuthMiddleware(),
        //       ],
        //       name: _Paths.profile,
        //       page: () => const ProfileView(),
        //       title: 'Profile',
        //       transition: Transition.size,
        //       bindings: [ProfileBinding()],
        //     ),
        //     GetPage(
        //       name: _Paths.products,
        //       page: () => const ProductsView(),
        //       title: 'Products',
        //       transition: Transition.cupertino,
        //       showCupertinoParallax: true,
        //       participatesInRootNavigator: false,
        //       bindings: [ProductsBinding(), ProductDetailsBinding()],
        //       children: [
        //         GetPage(
        //           name: _Paths.productDetails,
        //           transition: Transition.cupertino,
        //           showCupertinoParallax: true,
        //           page: () => const ProductDetailsView(),
        //           bindings: const [],
        //           middlewares: [
        //             //only enter this route when authed
        //             EnsureAuthMiddleware(),
        //           ],
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
        GetPage(
          name: _Paths.settings,
          page: () => const SettingsView(),
          bindings: [
            SettingsBinding(),
          ],
        ),
        GetPage(
          name: _Paths.profile,
          page: () => const ProfileView(),
          title: 'Profile',
          transition: Transition.size,
          bindings: [ProfileBinding()],
        ),
      ],
    ),
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
