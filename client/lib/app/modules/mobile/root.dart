import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preso_client/serverpod_client.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:preso_common/preso_common.dart';

import '../../../services/auth_service.dart';
import '../../routes/app_routes.dart';
import '../../../serverpod_client.dart' as pod;

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

class RootController extends GetxController {
  var tabIndex = 0.obs;

  // var store = null.obs;

  void changePage(int index) {
    tabIndex.value = index;
  }

  @override
  void onReady() {}

  Future init() async {
    var storeId = 1;
    var tenants = await pod.client.store.get(storeId);
  }

  final List<String> imageUrls = [
    'https://picsum.photos/id/10/800/600',
    'https://picsum.photos/id/11/800/600',
    'https://picsum.photos/id/12/800/600',
    'https://picsum.photos/id/13/800/600',
    'https://picsum.photos/id/14/800/600',
  ];
}

class RootBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<RootController>(
        () => RootController(),
      )
    ];
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.red,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlinedButton(
              onPressed: () {}, child: Icon(Icons.select_all_sharp)),
        ),
      ),
      body: Obx(() => pages[controller.tabIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.tabIndex.value,
          onTap: (index) => controller.changePage(index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'nav.home'.tr,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: '业务',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: '学校',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: 'nav.my'.tr,
            ),
          ],
        ),
      ),
    );
  }
}

// 页面1
class HomePage extends StatelessWidget {
  final controller = Get.find<RootController>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 240,
            child: Swiper(
              itemBuilder: (context, index) {
                return ClipRRect(
                  // borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: controller.imageUrls[index],
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                );
              },
              itemCount: controller.imageUrls.length,
              pagination: SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                  color: Colors.grey,
                  activeColor: Colors.blue,
                ),
              ),
              // pagination: SwiperPagination(),
              control: SwiperControl(),
            ),
          ),
        ],
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
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '我的',
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
