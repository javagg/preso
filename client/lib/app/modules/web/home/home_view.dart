import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preso_client/serverpod_client.dart';

import '../../../../services/auth_service.dart';
import '../../../routes/app_routes.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      route: Routes.home,
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
              leading: Hero(tag: "logo", child: FlutterLogo()),
              title: RouterListener(builder: (context) {
                final title = context.location;
                return Text(title);
              }),
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
                // Obx(
                //   () {
                //     return AuthService.to.isLoggedInValue
                //         ? IconButton(
                //             icon: const Icon(Icons.logout),
                //             onPressed: () {
                //               AuthService.to.logout();
                //               Get.toNamed(Routes.login);
                //             },
                //           )
                //         : IconButton(
                //             icon: const Icon(Icons.login),
                //             onPressed: () => Get.toNamed(Routes.login),
                //           );
                //   },
                // ),
                DropdownButton<String>(
                  value: "选项1",
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.deepPurple),
                  alignment: AlignmentDirectional.bottomCenter,
                  onChanged: (newValue) {},
                  items: <String>['选项1', '选项2', '选项3']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ]),
          body: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(Icons.home_max),
                              title: Text("Dashboard"),
                              onTap: () => Get.offAndToNamed(Routes.dashboard),
                            ),
                            ExpansionTile(
                              leading: Icon(Icons.card_membership),
                              title: Text("Membership"),
                              children: [
                                ListTile(
                                  title: Text("Members"),
                                  onTap: () =>
                                      Get.offAndToNamed(Routes.members),
                                ),
                                ListTile(
                                  title: Text("Profile"),
                                  onTap: () =>
                                      Get.offAndToNamed(Routes.profile),
                                ),
                              ],
                            ),
                            ExpansionTile(
                              leading: Icon(Icons.offline_pin),
                              title: Text("Tenant"),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 24.0),
                                  child: ListTile(
                                    title: Text("tenant list"),
                                    onTap: () =>
                                        Get.offAndToNamed(Routes.tanents),
                                  ),
                                ),
                              ],
                            ),
                            ExpansionTile(
                              title: Text("main"),
                              children: [
                                ListTile(title: Text("Home")),
                              ],
                            ),
                            ExpansionTile(
                              title: Text("main"),
                              children: [
                                ListTile(title: Text("Home")),
                              ],
                            ),
                            Text(
                              'Column-1',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  color: Colors.teal,
                  child: GetRouterOutlet(
                    initialRoute: Routes.dashboard,
                    anchorRoute: Routes.home,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
