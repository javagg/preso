import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
// import 'package:preso_common/preso_common.dart';
// import 'package:preso_common/preso_common.dart';

import '../../../services/auth_service.dart';
import '../../routes/app_routes.dart';
import 'root/controller.dart';
export 'root/controller.dart';

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

class RootView extends GetView<RootController> {
  RootView({super.key});

  final List<Widget> pages = [
    HomePage(),
    Page2(),
    Page3(),
    MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[controller.tabIndex.value]),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          selectedIndex: controller.tabIndex.value,
          onDestinationSelected: (value) => controller.changePage(value),
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'nav.home'.tr,
            ),
            NavigationDestination(
              icon: Icon(Icons.business),
              label: '业务',
            ),
            NavigationDestination(
              icon: Icon(Icons.school),
              label: '学校',
            ),
            NavigationDestination(
              icon: Icon(Icons.account_box),
              label: 'nav.my'.tr,
            ),
          ],
        ),
      ),
      // bottomNavigationBar: Obx(
      //   () => BottomNavigationBar(
      //     currentIndex: controller.tabIndex.value,
      //     onTap: (index) => controller.changePage(index),
      //     items: [
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.home),
      //         label: 'nav.home'.tr,
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.business),
      //         label: '业务',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.school),
      //         label: '学校',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.account_box),
      //         label: 'nav.my'.tr,
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

// 页面1
class HomePage extends StatelessWidget {
  final controller = Get.find<RootController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.red,
        centerTitle: false,
        leadingWidth: 0,
        title: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor:
                Colors.transparent.withAlpha((255.0 * 0.1).round()),
          ),
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [Text("关山大道店"), Icon(Icons.arrow_drop_down_sharp)],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedOverflowBox(
              size: Size(Get.width, 240),
              // height: 240,
              child: SizedBox(
                height: 260,
                child: Swiper(
                  itemBuilder: (context, index) {
                    return CachedNetworkImage(
                      imageUrl: controller.imageUrls[index],
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    );
                  },
                  itemCount: controller.imageUrls.length,
                  pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                      color: Colors.grey,
                      activeColor: Colors.blue,
                    ),
                  ),
                  control: SwiperControl(),
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 300,
                  child: Card(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            "app.card".tr,
                            style: Get.textTheme.titleMedium,
                          ),
                          trailing: Text(
                            "common.more".tr,
                            style: Get.textTheme.titleSmall,
                          ),
                        ),
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Image.network(
                            "https://www.itying.com/images/flutter/1.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 240,
                  child: Card(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            "app.trainer".tr,
                            style: Get.textTheme.titleMedium,
                          ),
                          // trailing: Text(
                          //   "common.more".tr,
                          //   style: Get.textTheme.titleSmall,
                          // ),
                        ),
                        Expanded(
                          child: CarouselView(
                            itemSnapping: true,
                            enableSplash: false,
                            itemExtent: 180,
                            padding: EdgeInsets.all(8.0),
                            children: [
                              Column(children: [
                                CircleAvatar(
                                  radius: 48,
                                  child: Icon(Icons.access_alarm),
                                ),
                                Text("孙教练"),
                                Row(
                                  children: ["减脂", "增肌", "产后恢复"].map((ele) {
                                    return Chip(
                                      label: Text(
                                        ele,
                                        style: TextStyle(fontSize: 9),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ]),
                              Column(children: [
                                CircleAvatar(
                                  radius: 48,
                                  child: Icon(Icons.access_alarm),
                                ),
                                Text("孙教练"),
                                Row(
                                  children: ["减脂", "增肌", "产后恢复"].map((ele) {
                                    return Chip(
                                      label: Text(
                                        ele,
                                        style: TextStyle(fontSize: 9),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ]),
                              Column(children: [
                                CircleAvatar(
                                  radius: 48,
                                  child: Icon(Icons.access_alarm),
                                ),
                                Text("孙教练"),
                                Row(
                                  children: ["减脂", "增肌", "产后恢复"].map((ele) {
                                    return Chip(
                                      label: Text(
                                        ele,
                                        style: TextStyle(fontSize: 9),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '业务页面',
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '学校页面',
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}

class MyPage extends StatelessWidget {
  var controller = Get.find<RootController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => GridView.builder(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, // 每行显示2个项目
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 1.0, // 宽高比
          ),
          itemCount: controller.items.length,
          itemBuilder: (context, index) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, size: 40, color: Colors.amber),
                  SizedBox(height: 10),
                  Text(controller.items[index], style: TextStyle(fontSize: 16)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
