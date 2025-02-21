import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   color: Colors.red,
    //   child: Center(
    //        child: Obx(
    //         () => Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             const Text(
    //               'DashboardView is working',
    //               style: TextStyle(fontSize: 20),
    //             ),
    //             Text('Time: ${controller.now.value.toString()}'),
    //           ],
    //         ),
    //       ),
    //     ),
    // );
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'DashboardView is working',
                style: TextStyle(fontSize: 20),
              ),
              Text('Time: ${controller.now.value.toString()}'),
            ],
          ),
        ),
      ),
    );
  }
}
