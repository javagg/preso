import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      route: Routes.root,
      builder: (context) {
        return Scaffold(
          body: GetRouterOutlet(
            initialRoute: Routes.dashboard,
            anchorRoute: Routes.root,
          ),
          bottomNavigationBar: IndexedRouteBuilder(
              routes: const [
                Routes.dashboard,
                Routes.profile,
                Routes.products
              ],
              builder: (context, routes, index) {
                final delegate = context.delegate;
                return BottomNavigationBar(
                  currentIndex: index,
                  onTap: (value) => delegate.toNamed(routes[value]),
                  items: const [
                    // _Paths.HOME + [Empty]
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    // _Paths.HOME + Routes.PROFILE
                    BottomNavigationBarItem(
                      icon: Icon(Icons.account_box_rounded),
                      label: 'Profile',
                    ),
                    // _Paths.HOME + _Paths.PRODUCTS
                    BottomNavigationBarItem(
                      icon: Icon(Icons.account_box_rounded),
                      label: 'Products',
                    ),
                  ],
                );
              }),
        );
      },
    );
  }
}
