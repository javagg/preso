import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:preso_client/serverpod_client.dart';

import '../../../services/auth_service.dart';
import '../../routes/app_routes.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            color: Colors.red,
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Get.toNamed(Routes.root);
              //to close the drawer
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              Get.toNamed(Routes.settings);
              //to close the drawer

              Navigator.of(context).pop();
            },
          ),
          if (AuthService.to.isLoggedInValue)
            ListTile(
              title: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              onTap: () {
                AuthService.to.logout();
                Get.toNamed(Routes.login);
                //to close the drawer

                Navigator.of(context).pop();
              },
            ),
          if (!AuthService.to.isLoggedInValue)
            ListTile(
              title: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              onTap: () {
                Get.toNamed(Routes.login);
                //to close the drawer

                Navigator.of(context).pop();
              },
            ),
        ],
      ),
    );
  }
}

class RootController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}

class RootBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<RootController>(
        () => RootController(),
      )
    ];
  }
}

class RootView extends GetView<RootController> {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    // var sideMenu = controller.sideMenu;
    return GetRouterOutlet.builder(
      route: Routes.root, //'/', //Routes.home,
      // initialRoute: Routes.root,// '/',// Routes.root,
      builder: (context) {
        return Scaffold(
          // key: controller.scaffoldKey,
          appBar: AppBar(
            leading: Hero(tag: "logo", child: FlutterLogo()),
            // title: RouterListener(builder: (context) {
            //   final title = context.location;
            //   return Text(title);
            // }),
            centerTitle: true,
            actions: [
              sessionManager.isSignedIn // AuthService.to.isLoggedInValue
                  ? IconButton(
                      icon: const Icon(Icons.logout),
                      onPressed: () {
                        sessionManager.signOutDevice();
                        AuthService.to.logout();
                        Get.toNamed(Routes.login);
                      },
                    )
                  : IconButton(
                      icon: const Icon(Icons.login),
                      onPressed: () => Get.toNamed(Routes.login),
                    ),
            ],
          ),
          body: GetRouterOutlet(
            initialRoute: Routes.home,
            anchorRoute: Routes.root,
          ),
          bottomNavigationBar: IndexedRouteBuilder(
              routes: const [Routes.home, Routes.profile, Routes.products],
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
