import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:preso_common/preso_common.dart' show Trainer;

import '../../../serverpod_client.dart' as pod;
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
              icon: Icon(Icons.account_box),
              label: 'nav.my'.tr,
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageController extends GetxController {
  final List<String> imageUrls = [
    'https://picsum.photos/id/10/800/600',
    'https://picsum.photos/id/11/800/600',
    'https://picsum.photos/id/12/800/600',
    'https://picsum.photos/id/13/800/600',
    'https://picsum.photos/id/14/800/600',
  ];
  final currentStore = 1.obs;
  final storeName = 'storeName'.obs;

  var trainers = [
    Trainer(
        name: "trainer",
        description: "ppapaaap",
        gender: "male",
        age: 20,
        headshot: "",
        photos: "",
        videos: "",
        servingCity: "",
        servingHours: "",
        classFee: 199,
        phone: "110")
  ].obs;

  @override
  void onReady() {
    super.onReady();
    pod.client.store.get(currentStore.value).then((store) {
      storeName.value = store!.name;
    });
  }
}

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

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
          onPressed: () {
            Get.bottomSheet(
              Container(
                height: 300,
                color: Colors.red,
              ),
            );
          },
          child: Obx(
            () {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(controller.storeName.value),
                  Icon(Icons.arrow_drop_down_sharp)
                ],
              );
            },
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
                    height: 180,
                    child: Card(
                        child: Column(children: [
                      Obx(() {
                        return ListTile(
                          title: Text(
                            controller.storeName.value,
                            style: Get.textTheme.titleMedium,
                          ),
                          subtitle: Row(
                            children: [
                              Chip(
                                label: Text("24小时"),
                                // onSelected: (bool value) {},
                              )
                            ],
                          ),
                          trailing: Icon(Icons.arrow_right_outlined),
                          onTap: () {
                            Get.bottomSheet(
                              Container(
                                height: 300,
                                color: Colors.red,
                              ),
                            );
                          },
                        );
                      }),
                    ]))),
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

class MyPageController extends GetxController {
  var items = List<String>.generate(20, (index) => 'Item ${index + 1}').obs;
}

class MyPage extends GetView<MyPageController> {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => GridView.builder(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 1.0,
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
