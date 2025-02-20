import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/root_controller.dart';
import 'drawer.dart';

class RootView extends GetView<RootController> {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // endDrawer: const DrawerWidget(),
        // drawer: const DrawerWidget(),
        appBar: AppBar(
          title: RouterListener(builder: (context) {
            final title = context.location;
            return Text(title);
          }),
          centerTitle: true,
        ),
        body: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  // Flexible(
                  //   flex: 0,
                  //   child: Text("head"),
                  // ),
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
                            leading: Icon(Icons.settings),
                            title: Text("Dashboard"),
                            children: [
                              ListTile(
                                title: Text("Settings"),
                                onTap: () => Get.offAndToNamed(Routes.settings),
                              ),
                              ListTile(
                                title: Text("Profile"),
                                onTap: () => Get.offAndToNamed(Routes.profile),
                              ),
                            ],
                          ),
                          ExpansionTile(
                            title: Text("main"),
                            children: [
                              ListTile(title: Text("Home")),
                              ListTile(title: Text("Home")),
                              ListTile(title: Text("Home")),
                              ListTile(title: Text("Home")),
                              ListTile(title: Text("Home")),
                              ListTile(title: Text("Home")),
                              ListTile(title: Text("Home")),
                              ListTile(title: Text("Home")),
                            ],
                          ),
                          ExpansionTile(
                            title: Text("main"),
                            children: [
                              ListTile(title: Text("Home")),
                              ListTile(title: Text("Home")),
                              ListTile(title: Text("Home")),
                              ListTile(title: Text("Home")),
                              ListTile(title: Text("Home")),
                              ListTile(title: Text("Home")),
                              ListTile(title: Text("Home")),
                              ListTile(title: Text("Home")),
                            ],
                          ),
                          ExpansionTile(
                            title: Text("main"),
                            children: [
                              ListTile(title: Text("Home")),
                              ListTile(title: Text("Home")),
                              ListTile(title: Text("Home")),
                              ListTile(title: Text("Home")),
                              ListTile(title: Text("Home")),
                              ListTile(title: Text("Home")),
                              ListTile(title: Text("Home")),
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
                  initialRoute: Routes.home,
                  anchorRoute: '/',
                ),
              ),
            )
          ],
        ));
  }
}
