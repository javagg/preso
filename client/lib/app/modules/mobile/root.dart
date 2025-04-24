import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:preso_client/app/modules/appointment/appointment_view.dart';
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
    AppointmentPage(),
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
              icon: Icon(Icons.home_outlined),
              label: 'nav.home'.tr,
            ),
            NavigationDestination(
              icon: Icon(Icons.schedule_outlined),
              label: 'nav.appointment'.tr,
            ),
            NavigationDestination(
              icon: Icon(Icons.account_box_outlined),
              label: 'nav.my'.tr,
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCardData {
  final String name;
  final double price;
  final String imageUrl;

  ProductCardData({
    required this.name,
    required this.price,
    required this.imageUrl,
  });
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

  var productCards = [
    ProductCardData(
      name: "单次卡",
      price: 9.9,
      imageUrl: "",
    ),
    ProductCardData(
      name: "月卡(单店)",
      price: 99,
      imageUrl: "",
    ),
    ProductCardData(
      name: "月卡(通卡)",
      price: 169,
      imageUrl: "",
    ),
    ProductCardData(
      name: "年卡(单店)",
      price: 799,
      imageUrl: "",
    ),
  ];
  var trainers = [
    Trainer(
        name: "王教练",
        description: "ppapaaap",
        gender: "male",
        age: 20,
        headshot: "",
        photos: "",
        videos: "",
        servingCity: "",
        servingHours: "",
        classFee: 199,
        phone: "110"),
    Trainer(
        name: "孙教练",
        description: "ppapaaap",
        gender: "male",
        age: 20,
        headshot: "",
        photos: "",
        videos: "",
        servingCity: "",
        servingHours: "",
        classFee: 199,
        phone: "110"),
    Trainer(
        name: "张无忌",
        description: "ppapaaap",
        gender: "male",
        age: 20,
        headshot: "",
        photos: "",
        videos: "",
        servingCity: "",
        servingHours: "",
        classFee: 199,
        phone: "110"),
    Trainer(
        name: "赵敏",
        description: "ppapaaap",
        gender: "male",
        age: 20,
        headshot: "",
        photos: "",
        videos: "",
        servingCity: "",
        servingHours: "",
        classFee: 199,
        phone: "110"),
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
            Get.bottomSheet(SizedBox(
                height: 300,
                // color: Colors.red,
                child: Column(
                  children: [],
                )));
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
                    height: 120,
                    child: Card(
                        child: Column(
                      children: [
                        Obx(
                          () {
                            return ListTile(
                              title: Text(
                                controller.storeName.value,
                                style: Get.textTheme.titleMedium,
                              ),
                              subtitle: Row(
                                  children: ["24小时", "月付制", "无推销"].map((tag) {
                                return Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4),
                                    color: Colors.limeAccent,
                                    child: Text(
                                      tag,
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ),
                                );
                              }).toList()),
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
                          },
                        ),
                        ListTile(
                          dense: true,
                          leading: Icon(
                            Icons.location_on_outlined,
                            size: 20,
                          ),
                          title: Text("关山大道300号硬铁广场3层1001室"),
                          // subtitle: Text("110020"),
                          // trailing: Icon(Icons.arrow_right_outlined),
                        )
                      ],
                    ))),
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
                        Expanded(
                          child: CarouselView(
                            itemSnapping: true,
                            enableSplash: false,
                            shrinkExtent: 200,
                            itemExtent: 200, children: controller.productCards.map((card) {
                            return Container(
                              color: Colors.green,
                              margin: EdgeInsets.all(8),
                              // child: Text("data"),
                              child: Column(
                                children: [
                                  Expanded(child: Column(
                                    children: [   Text(card.name),
                                  Text(card.price.toString()),],
                                  )),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          backgroundColor: Colors.yellowAccent,
                                          elevation: 2,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: Text("app.buyNow".tr),
                                      )
                                    ),
                                  )
                                ],
                              ),
                            );
                          }).toList()),
                        )
                        // AspectRatio(
                        //   aspectRatio: 16 / 9,
                        //   child: Image.network(
                        //     "https://www.itying.com/images/flutter/1.png",
                        //     fit: BoxFit.cover,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 210,
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
                            itemExtent: 120,
                            shrinkExtent: 120,
                            children: controller.trainers.map((trainer) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 32,
                                      child: Icon(Icons.access_alarm),
                                    ),
                                    Text(trainer.name),
                                    Wrap(
                                      children: ["减脂", "增肌", "产后恢复"].map((ele) {
                                        return Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 4),
                                            color: Colors.limeAccent,
                                            child: Text(
                                              ele,
                                              style: TextStyle(fontSize: 9),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
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

class AppointmentPageController extends GetxController {}

class AppointmentPage extends GetView<AppointmentPageController> {
  const AppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("appointment"),
      ),
    );
  }
}

class MyPageController extends GetxController {
  var username = "john".obs;

  var items = List<String>.generate(12, (index) => 'Item ${index + 1}').obs;
}

class MyPage extends GetView<MyPageController> {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 32,
                  // backgroundImage: NetworkImage("https://ww"),
                  child: Icon(Icons.person),
                ),
                title: Text(controller.username.value),
                subtitle: Text("110020"),
                trailing: Text("正常"),
              ),
              const Divider(
                height: 1,
                thickness: 1,
              ),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      // leading: Icon(Icons.favorite),
                      title: Text("app.tools".tr),
                      // trailing: Icon(Icons.arrow_right),
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      spacing: 16.0,
                      runSpacing: 4.0,
                      children: controller.items.map((item) {
                        return SizedBox(
                          height: 56,
                          width: 72,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.star, size: 40, color: Colors.amber),
                              // SizedBox(height: 10),
                              Text(item, style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                    //   child: GridView.builder(
                    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //       crossAxisCount: 5,
                    //       crossAxisSpacing: 5,
                    //       mainAxisSpacing: 5,
                    //       childAspectRatio: 1.0,
                    //     ),
                    //     itemCount: controller.items.length,
                    //     itemBuilder: (context, index) {
                    //       return Center(
                    //         child: SizedBox(
                    //           height: 20,
                    //           child: Column(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               Icon(Icons.star, size: 40, color: Colors.amber),
                    //               // SizedBox(height: 10),
                    //               Text(controller.items[index],
                    //                   style: TextStyle(fontSize: 16)),
                    //             ],
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
