import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../mobile_routes/app_pages.dart';
import 'root_controller.dart';
import 'drawer.dart';

class RootView extends GetView<RootController> {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: RouterListener(builder: (context) {
          final title = context.location;
          return Text(title);
        }),
        centerTitle: true,
      ),
      body: GetRouterOutlet(
        initialRoute: Routes.home,
        anchorRoute: '/',
      ),
    );
  }
}
