import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaleBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<SaleController>(
        () => SaleController(),
      )
    ];
  }
}

class SaleController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final currentIndex = 0.obs; // 响应式变量

  final List<Tab> myTabs = <Tab>[
    Tab(text: '首页'),
    Tab(text: '消息'),
    Tab(text: '个人'),
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: myTabs.length, vsync: this);
    // 监听 Tab 变化
    tabController.addListener(() {
      currentIndex.value = tabController.index;
    });
  }

  void changeTab(int index) {
    tabController.animateTo(index);
    currentIndex.value = index;
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}

class SaleView extends GetView<SaleController> {
  // final SaleController tabController = Get.put(SaleController());

  const SaleView({super.key});

  @override
  Widget build(BuildContext context) {
    // return Text("sales");
    return Scaffold(
        appBar: AppBar(
        title: Obx(() => Text('当前 Tab: ${controller.currentIndex.value + 1}')),
        bottom: TabBar(
          controller: controller.tabController,
          tabs: controller.myTabs,
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: [
          Center(child: Text('首页内容')),
          Center(child: Text('消息内容')),
          Center(child: Text('个人中心')),
        ],
      ),
    );
  }
}
