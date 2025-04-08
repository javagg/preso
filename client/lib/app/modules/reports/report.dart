import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';

class ReportBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<ReportController>(
        () => ReportController(),
      )
    ];
  }
}

class ReportController extends GetxController {}


class ReportView extends GetView<ReportController> {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetRouterOutlet(
        initialRoute: Routes.sales,
        anchorRoute: Routes.reports,
      ),
    );
  }
}
