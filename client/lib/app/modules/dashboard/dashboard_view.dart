import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dashboard_controller.dart';

const images = <String>[
  'images/bg0.jpeg',
  'images/bg1.jpeg',
  'images/bg2.jpeg',
];

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
      body: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 300,
              child: Swiper(
                itemBuilder: (context, index) {
                  final image = images[index];
                  return Image.asset(
                    image,
                    fit: BoxFit.fill,
                  );
                },
                indicatorLayout: PageIndicatorLayout.COLOR,
                autoplay: true,
                itemCount: images.length,
                pagination: const SwiperPagination(),
                control: const SwiperControl(),
              ),
            ),
            const Text(
              'DashboardView is working',
              style: TextStyle(fontSize: 20),
            ),
            Text('Time: ${controller.now.value.toString()}'),
          ],
        ),
      ),
    );
  }
}
