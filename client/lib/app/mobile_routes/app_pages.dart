import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../middleware/auth_middleware.dart';
import '../modules/dashboard/dashboard_binding.dart';
import '../modules/dashboard/dashboard_view.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/login/login_binding.dart';
import '../modules/login/login_view.dart';
import '../modules/product_details/product_details_binding.dart';
import '../modules/product_details/product_details_view.dart';
import '../modules/products/products_binding.dart';
import '../modules/products/products_view.dart';
import '../modules/profile/profile_binding.dart';
import '../modules/profile/profile_view.dart';
import '../modules/root/root_binding.dart';
import '../modules/root/root_view.dart';
import '../modules/settings/settings_binding.dart';
import '../modules/settings/settings_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes1 = [
    GetPage(
      name: '/',
      page: () => const RootView(),
      bindings: [RootBinding()],
      participatesInRootNavigator: true,
      preventDuplicates: true,
      children: [
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
          preventDuplicates: true,
          name: _Paths.home,
          page: () => const HomeView(),
          bindings: [
            HomeBinding(),
          ],
          title: null,
          children: [
            GetPage(
              name: _Paths.dashboard,
              page: () => const DashboardView(),
              bindings: [
                DashboardBinding(),
              ],
            ),
            GetPage(
              middlewares: [
                //only enter this route when authed
                EnsureAuthMiddleware(),
              ],
              name: _Paths.profile,
              page: () => const ProfileView(),
              title: 'Profile',
              transition: Transition.size,
              bindings: [ProfileBinding()],
            ),
            GetPage(
              name: _Paths.products,
              page: () => const ProductsView(),
              title: 'Products',
              transition: Transition.cupertino,
              showCupertinoParallax: true,
              participatesInRootNavigator: false,
              bindings: [ProductsBinding(), ProductDetailsBinding()],
              children: [
                GetPage(
                  name: _Paths.productDetails,
                  transition: Transition.cupertino,
                  showCupertinoParallax: true,
                  page: () => const ProductDetailsView(),
                  bindings: const [],
                  middlewares: [
                    //only enter this route when authed
                    EnsureAuthMiddleware(),
                  ],
                ),
              ],
            ),
          ],
        ),
        
        GetPage(
          name: _Paths.settings,
          page: () => const SettingsView(),
          bindings: [
            SettingsBinding(),
          ],
        ),
      ],
    ),
  ];

  static final routes = [
    GetPage(
      name: '/',
      page: () => const RootView(),
      bindings: [RootBinding()],
      participatesInRootNavigator: true,
      preventDuplicates: true,
      children: [
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
          preventDuplicates: true,
          name: _Paths.home,
          page: () => const HomeView(),
          bindings: [
            HomeBinding(),
          ],
          title: null,
          children: [
            GetPage(
              name: _Paths.dashboard,
              page: () => const DashboardView(),
              bindings: [
                DashboardBinding(),
              ],
            ),
            GetPage(
              middlewares: [
                //only enter this route when authed
                EnsureAuthMiddleware(),
              ],
              name: _Paths.profile,
              page: () => const ProfileView(),
              title: 'Profile',
              transition: Transition.size,
              bindings: [ProfileBinding()],
            ),
            GetPage(
              name: _Paths.products,
              page: () => const ProductsView(),
              title: 'Products',
              transition: Transition.cupertino,
              showCupertinoParallax: true,
              participatesInRootNavigator: false,
              bindings: [ProductsBinding(), ProductDetailsBinding()],
              children: [
                GetPage(
                  name: _Paths.productDetails,
                  transition: Transition.cupertino,
                  showCupertinoParallax: true,
                  page: () => const ProductDetailsView(),
                  bindings: const [],
                  middlewares: [
                    //only enter this route when authed
                    EnsureAuthMiddleware(),
                  ],
                ),
              ],
            ),
          ],
        ),
        
        GetPage(
          name: _Paths.settings,
          page: () => const SettingsView(),
          bindings: [
            SettingsBinding(),
          ],
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
