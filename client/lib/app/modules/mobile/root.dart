import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:marquee/marquee.dart';
import 'package:preso_client/app/modules/mobile/map.dart';
import 'package:preso_client/icons.dart';
import 'package:preso_common/preso_common.dart' show Store, Trainer;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:sprintf/sprintf.dart';

import '../../../serverpod_client.dart' as pod;
import '../../../services/auth_service.dart';
import '../../../widgets/smart_switch.dart';
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
  final double originalPrice;
  final double strikePrice;
  final String imageUrl;

  ProductCardData({
    required this.name,
    required this.strikePrice,
    required this.originalPrice,
    required this.imageUrl,
  });
}

class StoreStatus {
  final double temperature;
  final double humidity;
  final int numWorkingOut;
  final List<String> cameraSnapshots;

  StoreStatus(
      {required this.temperature,
      required this.humidity,
      required this.numWorkingOut,
      required this.cameraSnapshots});
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

  late Store store;

  var productCards = [
    ProductCardData(
      name: "单次卡",
      strikePrice: 9.9,
      originalPrice: 19.9,
      imageUrl: "",
    ),
    ProductCardData(
      name: "月卡(单店)",
      strikePrice: 99,
      originalPrice: 159,
      imageUrl: "",
    ),
    ProductCardData(
      name: "月卡(通卡)",
      strikePrice: 169,
      originalPrice: 199,
      imageUrl: "",
    ),
    ProductCardData(
      name: "年卡(单店)",
      strikePrice: 799,
      originalPrice: 899,
      imageUrl: "",
    ),
  ];
  var trainers = [
    Trainer(
        name: "吴教练",
        description: "ppapaaap",
        gender: "male",
        age: 20,
        headshot: "assets/images/wuyanzu.jpeg",
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
        headshot: "assets/images/jirounan.jpeg",
        photos: "",
        videos: "",
        servingCity: "",
        servingHours: "",
        classFee: 199,
        phone: "110"),
    Trainer(
        name: "Joe Black",
        description: "ppapaaap",
        gender: "male",
        age: 20,
        headshot: "assets/images/nvjiao1.png",
        photos: "",
        videos: "",
        servingCity: "",
        servingHours: "",
        classFee: 199,
        phone: "110"),
    Trainer(
        name: "大洋马",
        description: "ppapaaap",
        gender: "male",
        age: 20,
        headshot: "assets/images/nvjiao2.jpg",
        photos: "",
        videos: "",
        servingCity: "",
        servingHours: "",
        classFee: 199,
        phone: "110"),
  ].obs;

  final storeStatus = StoreStatus(
      numWorkingOut: 23,
      temperature: 23.5,
      humidity: 50.0,
      cameraSnapshots: [
        "https://th.bing.com/th/id/OIP.7SSOy8x59mzneSIwv3UurAHaE5?rs=1&pid=ImgDetMain",
        "https://th.bing.com/th/id/OIP.OMb4hCsYrJNbWdCgmdRuegHaE8?rs=1&pid=ImgDetMain",
        "https://th.bing.com/th/id/OIP.9INWq_XaPVqnsmOah6uW-wHaFj?rs=1&pid=ImgDetMain",
      ]);
  @override
  void onReady() {
    super.onReady();
    pod.client.store.get(currentStore.value).then((s) {
      store = s!;
      storeName.value = s!.name;
    });
  }
}

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final String fmt = 'app.howManyWorkingout'.tr;
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Container(
                                padding: const EdgeInsets.all(1.0),
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  color: Colors.grey[200],
                                ),
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
                      leading: IconButton(
                        onPressed: () {
                          // Get.to(() => MapView());
                          Get.toNamed('/map', arguments: controller.store);
                        },
                        icon: Icon(
                          Icons.location_on_outlined,
                          size: 20,
                        ),
                      ),
                      title: Text("关山大道300号硬铁广场3层1001室"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.phone_outlined,
                              size: 20,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.wechat_outlined,
                              size: 20,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Icon(Icons.volume_up_outlined),
                    Expanded(
                      child: Marquee(
                        velocity: 40,
                        blankSpace: 100,
                        text: "欢迎来到来运动关山大道店健身",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.orange[400],
                  // elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () async {
                  // Get.dialog(arguments: )
                  await Get.defaultDialog(
                    title: "团购核销",
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Text(
                          "团购核销",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      Center(
                        child: Text(
                          "美图/抖音/大众点评/高德/小红书",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 220,
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
                          shrinkExtent: 120,
                          itemExtent: 120,
                          children: controller.productCards.map((card) {
                            return Container(
                              decoration: BoxDecoration(
                                color:
                                    Colors.orange[50]!.withValues(alpha: 0.6),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 16, bottom: 8),
                                          child: Text(
                                            card.name,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Row(
                                          textBaseline: TextBaseline.alphabetic,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.baseline,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "¥",
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              card.strikePrice.toString(),
                                              style: TextStyle(
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "¥ ${card.originalPrice}",
                                          style: TextStyle(
                                              fontSize: 14,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.orange[400],
                                        // elevation: 2,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        "app.buyNow".tr,
                                        style: TextStyle().copyWith(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }).toList()),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 200,
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
                                Expanded(
                                  child: ClipOval(
                                    child: Image.asset(
                                      trainer.headshot,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Text(
                                  trainer.name,
                                  style: Get.textTheme.bodySmall,
                                ),
                                Wrap(
                                  children: ["减脂", "增肌", "产后恢复"].map((ele) {
                                    return Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 4),
                                        child: Text(
                                          ele,
                                          style: TextStyle(
                                              fontSize: 9, color: Colors.white),
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
            ),
            Card(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        // sprintf(fmt, controller.storeStatus.numWorkingOut),
                        "当前有 ${controller.storeStatus.numWorkingOut} 人在健身",
                        style: Get.textTheme.titleSmall,
                      ),
                      Spacer(),
                      Text(
                        "${"common.temperature".tr}: ${controller.storeStatus.temperature}°C ${"common.temperature".tr}: ${controller.storeStatus.humidity}%",
                        //  25.7°C 湿度: 50%",
                        style: Get.textTheme.titleSmall!.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                ...(controller.storeStatus.cameraSnapshots.map((url) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: CachedNetworkImage(
                        imageUrl: url,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }).toList())
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "app.techSupport".tr,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
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
      body: Column(
        children: [
          SmartSwitch(
            size: Size(172, 86),
            states: [false, true, false],
          ),
          SfCalendar(
            view: CalendarView.week,
            initialDisplayDate: DateTime.now(),
            showNavigationArrow: true,
          ),
        ],
      ),
    );
  }
}

class ToolItem {
  final String name;
  final IconData icon;
  ToolItem({required this.name, required this.icon});
}

class MyPageController extends GetxController {
  var username = "john".obs;

  var items = List<String>.generate(12, (index) => 'Item ${index + 1}').obs;

  final tools = [
    ToolItem(
      name: "在线购卡",
      icon: AppIcons.cart,
    ),
    ToolItem(
      name: "团购验券",
      icon: AppIcons.coupon,
    ),
    ToolItem(
      name: "录入人脸",
      icon: AppIcons.coupon,
    ),
    ToolItem(
      name: "器械报修",
      icon: AppIcons.repair,
    ),
    ToolItem(
      name: "店铺通知",
      icon: AppIcons.coupon,
    ),
    ToolItem(
      name: "会员协议",
      icon: AppIcons.handshake,
    ),
    ToolItem(
      name: "在线客服",
      icon: AppIcons.coupon,
    ),
    ToolItem(
      name: "到店记录",
      icon: AppIcons.coupon,
    ),
    ToolItem(
      name: "我要留言",
      icon: AppIcons.coupon,
    ),
  ];
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/profile_bg.png'),
                fit: BoxFit.cover),
          ),
        ),
        Container(
          height: 250,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black.withValues(alpha: 0.7),
                Colors.transparent,
              ],
            ),
          ),
        ),

        // 内容区域
        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // 用户头像
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://example.com/avatar.jpg'), // 替换为实际头像URL
              ),
              SizedBox(width: 20),

              // 用户信息
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '张伟',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Flutter开发者 | 技术爱好者',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        _buildInfoItem('关注', '1.2k'),
                        _buildInfoItem('粉丝', '890'),
                        _buildInfoItem('点赞', '5.6k'),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  // 构建数据项组件
  Widget _buildInfoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class MyPage extends GetView<MyPageController> {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("我的"),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              ProfileHeader(),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 32,
                    // backgroundImage: NetworkImage("https://ww"),
                    child: Icon(Icons.person),
                  ),
                  title: Text(controller.username.value),
                  subtitle: Text("110020"),
                  trailing: Text("正常"),
                ),
              ),
              const Divider(
                height: 1,
                thickness: 1,
              ),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text("app.myCards".tr),
                      trailing: TextButton(
                          onPressed: () {}, child: Text("common.more".tr)),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 200,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF2A2D3E), Color(0xFF1A1C28)],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          // 光晕效果
                          Positioned(
                            right: -50,
                            top: -50,
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.1),
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'VIP CARD',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.5,
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      'assets/icons/crown.svg',
                                      color: Colors.amber,
                                      width: 30,
                                    )
                                  ],
                                ),
                                SizedBox(height: 25),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundImage: NetworkImage(
                                          'https://example.com/avatar.jpg'),
                                    ),
                                    SizedBox(width: 15),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'John Doe',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          'Platinum Member',
                                          style: TextStyle(
                                            color: Colors.amber,
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Spacer(),
                                _buildCardNumber(),
                                SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Points: 25,380',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      'Valid Thru: 12/25',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      child: ListView.separated(
                        padding: EdgeInsets.all(16),
                        separatorBuilder: (_, __) => SizedBox(height: 16),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return _buildCouponItem(
                            title: index == 0
                                ? '限时折扣券'
                                : index == 1
                                    ? '满减券'
                                    : '运费抵扣券',
                            value: index == 0
                                ? '8折'
                                : index == 1
                                    ? '¥50'
                                    : '免运费',
                            condition: index == 0
                                ? '全品类商品可用'
                                : index == 1
                                    ? '满¥300可用'
                                    : '指定商品可用',
                            date: '有效期至 2024-12-31',
                            isExpired: index == 2,
                          );
                        },
                      ),
                    )
                  ],
                ),
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
                      children: controller.tools.map((item) {
                        return SizedBox(
                          height: 56,
                          width: 72,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(item.icon, size: 36),
                              // SizedBox(height: 10),
                              Text(item.name, style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardNumber() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
        (index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            '****',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              letterSpacing: 2,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCouponItem({
    required String title,
    required String value,
    required String condition,
    required String date,
    bool isExpired = false,
  }) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: isExpired ? Colors.grey[200] : Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Stack(
        children: [
          // 左侧虚线分割线
          Positioned(
            left: 120,
            top: 0,
            bottom: 0,
            child: CustomPaint(
              painter: _DashedLinePainter(),
            ),
          ),

          Row(
            children: [
              // 左侧优惠券价值区域
              Container(
                width: 120,
                decoration: BoxDecoration(
                  color: isExpired ? Colors.grey[300] : Colors.red[400],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                ),
                child: Center(
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: isExpired ? Colors.grey[500] : Colors.white,
                    ),
                  ),
                ),
              ),

              // 右侧详情区域
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isExpired ? Colors.grey : Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        condition,
                        style: TextStyle(
                          color: isExpired ? Colors.grey : Colors.black54,
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icon_time.svg',
                            color: isExpired ? Colors.grey : Colors.red,
                            width: 14,
                          ),
                          SizedBox(width: 4),
                          Text(
                            date,
                            style: TextStyle(
                              fontSize: 12,
                              color: isExpired ? Colors.grey : Colors.red,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),

          Positioned(
            right: 8,
            top: 8,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: isExpired ? Colors.grey : Colors.green,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                isExpired ? '已过期' : '可使用',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// 自定义虚线绘制
class _DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const dashWidth = 4;
    const dashSpace = 4;
    double startY = 0;

    while (startY < size.height) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY + dashWidth),
        paint,
      );
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
