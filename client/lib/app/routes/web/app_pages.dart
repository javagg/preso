import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preso_client/app/modules/login/login_view.dart';

import '../../middleware/auth_middleware.dart';
import '../../modules/login/login_binding.dart';
import '../../modules/member/member_binding.dart';
import '../../modules/member/member_view.dart';
import '../../modules/web/root/root_binding.dart';
import '../../modules/web/root/root_view.dart';
import '../../modules/dashboard/dashboard_binding.dart';
import '../../modules/dashboard/dashboard_view.dart';
import '../../modules/profile/profile_binding.dart';
import '../../modules/profile/profile_view.dart';
import '../../modules/settings/settings_binding.dart';
import '../../modules/settings/settings_view.dart';
import '../../modules/web/home/home_binding.dart';
import '../../modules/web/home/home_view.dart';
import '../../modules/tenant/tenant_binding.dart';
import '../../modules/tenant/tenant_view.dart';
import '../app_routes.dart';
export '../app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

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
          name: Paths.login,
          page: () => const LoginView(),
          bindings: [LoginBinding()],
        ),
        GetPage(
            preventDuplicates: true,
            name: Paths.home,
            page: () => const HomeView(),
            bindings: [
              HomeBinding(),
            ],
            title: null,
            children: [
              GetPage(
                name: Paths.dashboard,
                page: () => const DashboardView(),
                transition: Transition.noTransition,
                bindings: [
                  DashboardBinding(),
                ],
              ),
              GetPage(
                middlewares: [
                  // EnsureAuthMiddleware(),
                ],
                name: Paths.members,
                page: () => const MemberView(),
                title: 'Members',
                transition: Transition.noTransition,
                bindings: [MemberBinding()],
              ),
              GetPage(
                middlewares: [
                  EnsureAuthMiddleware(),
                ],
                name: Paths.tenants,
                page: () => const TenantView(),
                transition: Transition.noTransition,
                title: 'Tenant',
                // transition: Transition.size,
                bindings: [TenantBinding()],
              ),
              GetPage(
                middlewares: [
                  EnsureAuthMiddleware(),
                ],
                name: Paths.profile,
                page: () => const ProfileView(),
                transition: Transition.noTransition,
                title: 'Profile',
                // transition: Transition.size,
                bindings: [ProfileBinding()],
              ),
            ]),
        GetPage(
          name: Paths.settings,
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
