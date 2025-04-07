import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preso_client/app/modules/login/login_view.dart';
import 'package:preso_client/app/modules/store/store_binding.dart';
import 'package:preso_client/app/modules/store/store_view.dart';
import 'package:preso_client/app/modules/web/admin.dart';

import '../../middleware/auth_middleware.dart';
import '../../modules/login/login_binding.dart';
import '../../modules/member/member_binding.dart';
import '../../modules/member/member_view.dart';
import '../../modules/order/order_binding.dart';
import '../../modules/order/order_view.dart';
import '../../modules/web/root/root_binding.dart';
import '../../modules/web/root/root_view.dart';
import '../../modules/dashboard/dashboard_binding.dart';
import '../../modules/dashboard/dashboard_view.dart';
import '../../modules/profile/profile_binding.dart';
import '../../modules/profile/profile_view.dart';
import '../../modules/settings/settings_binding.dart';
import '../../modules/settings/settings_view.dart';
// import '../../modules/web/home/home_binding.dart';
// import '../../modules/web/home/home_view.dart';
import '../../modules/tenant/tenant_binding.dart';
import '../../modules/tenant/tenant_view.dart';
import '../app_routes.dart';
export '../app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.root;

  static final routes = [
    GetPage(
        name: Paths.root,
        page: () => const RootView(),
        bindings: [RootBinding()],
        participatesInRootNavigator: true,
        preventDuplicates: true,
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
              // EnsureAuthMiddleware(),
            ],
            name: Paths.orders,
            page: () => const OrderView(),
            transition: Transition.noTransition,
            title: 'orders'.tr,
            // transition: Transition.size,
            bindings: [OrderBinding()],
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
                    GetPage(
            middlewares: [
              // EnsureAuthMiddleware(),
            ],
            name: Paths.admin,
            page: () => const AdminView(),
            transition: Transition.noTransition,
            title: 'admin'.tr,
            // transition: Transition.size,
            bindings: [AdminBinding()],
            children: [
              GetPage(
                name: Paths.stores,
                page: () => const StoreView(),
                transition: Transition.noTransition,
                title: 'stores'.tr ,
                bindings: [StoreBinding()],
              ),
            ]
          ),
        ]),
    GetPage(
      middlewares: [
        //only enter this route when not authed
        EnsureNotAuthedMiddleware(),
      ],
      participatesInRootNavigator: true,
      name: Paths.login,
      page: () => const LoginView(),
      bindings: [LoginBinding()],
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
