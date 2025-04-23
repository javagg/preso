import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../routes/app_routes.dart';

import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:preso_client/serverpod_client.dart';

import '../../../../services/auth_service.dart';

class RootController extends GetxController {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  final sideMenu = SideMenuController();

  void openDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState?.closeEndDrawer();
  }

  void changePage(int index) {
    sideMenu.changePage(index);
  }

  var selectedItem = '未选择'.obs;
  var backgroundColor = Colors.white.obs;
  var textSize = 16.0.obs;

  final MenuController menuController = MenuController(); // MenuAnchor的控制器

  void selectItem(String value) {
    selectedItem.value = value;

    // 根据选择执行不同操作
    switch (value) {
      case '红色背景':
        backgroundColor.value = Colors.red[200]!;
        break;
      case '绿色背景':
        backgroundColor.value = Colors.green[200]!;
        break;
      case '蓝色背景':
        backgroundColor.value = Colors.blue[200]!;
        break;
      case '增大文字':
        textSize.value += 2;
        break;
      case '减小文字':
        textSize.value = textSize.value > 12 ? textSize.value - 2 : 12;
        break;
    }

    Get.snackbar(
      '菜单操作',
      '已选择: $value',
      snackPosition: SnackPosition.bottom,
      duration: Duration(seconds: 1),
    );
  }
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
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    var sideMenu = controller.sideMenu;
    return GetRouterOutlet.builder(
      route: Routes.dashboard,
      builder: (context) {
        return Scaffold(
          key: controller.scaffoldKey,
          appBar: AppBar(
            leading: Hero(tag: "logo", child: FlutterLogo()),
            centerTitle: true,
            actions: [
              MenuAnchor(
                  builder: (context, controller, child) {
                    return IconButton(
                      onPressed: () {
                        if (controller.isOpen) {
                          controller.close();
                        } else {
                          controller.open();
                        }
                      },
                      icon: Get.isDarkMode
                          ? const Icon(Icons.dark_mode_outlined)
                          : const Icon(Icons.light_mode_outlined),
                    );
                  },
                  menuChildren: [
                    MenuItemButton(
                      onPressed: () {
                        Get.changeTheme(ThemeData.light());
                        // Get.changeThemeMode(ThemeMode.light);
                      },
                      leadingIcon: Icon(Icons.light_mode_outlined),
                      child: Text('Light Mode'),
                    ),
                    MenuItemButton(
                      onPressed: () {
                        Get.changeTheme(ThemeData.dark());
                        // Get.changeThemeMode(ThemeMode.dark);
                      },
                      leadingIcon: Icon(Icons.dark_mode_outlined),
                      child: Text('Dark Mode'),
                    ),
                    MenuItemButton(
                      onPressed: () => Get.changeThemeMode(ThemeMode.system),
                      leadingIcon: Icon(Icons.auto_delete_sharp),
                      child: Text('Light Mode'),
                    )
                  ]),
              sessionManager.isSignedIn // AuthService.to.isLoggedInValue
                  ? IconButton(
                      icon: const Icon(Icons.logout),
                      onPressed: () {
                        sessionManager.signOutDevice();
                        AuthService.to.logout();
                        Get.toNamed(Routes.login);
                      },
                    )
                  : IconButton(
                      icon: const Icon(Icons.login),
                      onPressed: () => Get.toNamed(Routes.login),
                    ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 3),
                child: IconButton(
                  color: Colors.amberAccent, // model.baseAppBarItemColor,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  icon: const Icon(Icons.settings),
                  onPressed: () => controller.openDrawer(),
                ),
              ),
              MenuAnchor(
                controller: controller.menuController,
                style: MenuStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.white),
                  elevation: WidgetStateProperty.all(10),
                ),
                menuChildren: [
                  MenuItemButton(
                    onPressed: () {
                      controller.selectItem('关于应用');
                      controller.menuController.close();
                    },
                    child: const ListTile(
                      leading: Icon(Icons.info),
                      title: Text('关于应用'),
                    ),
                  ),
                  MenuItemButton(
                    onPressed: () {
                      controller.selectItem('设置');
                      controller.menuController.close();
                    },
                    child: const ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('设置'),
                    ),
                  ),
                ],
                child: IconButton(
                  icon: const Icon(Icons.add_a_photo),
                  onPressed: () {
                    if (controller.menuController.isOpen) {
                      controller.menuController.close();
                    } else {
                      controller.menuController.open();
                    }
                  },
                ),
              ),
            ],
          ),
          endDrawer:
              buildWebThemeSettings(context, (isMaterial3, brightness) {}),
          body: Row(
            children: [
              Expanded(
                flex: 1,
                child: SideMenu(
                  controller: sideMenu,
                  style: SideMenuStyle(
                    selectedTitleTextStyle:
                        Theme.of(context).textTheme.titleSmall,
                    unselectedTitleTextStyle:
                        Theme.of(context).textTheme.titleSmall,
                  ),
                  items: [
                    SideMenuItem(
                      title: 'menu.dashboard'.tr,
                      onTap: (index, _) {
                        sideMenu.changePage(index);
                        Get.offAndToNamed(Routes.dashboard);
                      },
                      icon: const Icon(Icons.dashboard),
                    ),
                    SideMenuItem(
                      title: 'menu.members'.tr,
                      onTap: (index, _) {
                        sideMenu.changePage(index);
                        Get.offAndToNamed(Routes.members);
                      },
                      icon: const Icon(Icons.account_box),
                    ),
                    SideMenuItem(
                      title: 'menu.trainers'.tr,
                      onTap: (index, _) {
                        sideMenu.changePage(index);
                        Get.offAndToNamed(Routes.trainers);
                      },
                      icon: const Icon(Icons.person_2),
                    ),
                    SideMenuItem(
                      title: 'menu.orders'.tr,
                      onTap: (index, _) {
                        sideMenu.changePage(index);
                        Get.offAndToNamed(Routes.orders);
                      },
                      icon: const Icon(Icons.battery_unknown),
                    ),
                    SideMenuExpansionItem(
                      title: "menu.admin".tr,
                      icon: const Icon(Icons.kitchen),
                      children: [
                        SideMenuItem(
                          title: 'menu.tenants'.tr,
                          onTap: (index, _) {
                            sideMenu.changePage(index);
                            Get.offAndToNamed(Routes.tenants);
                          },
                          icon: const Icon(Icons.supervisor_account),
                        ),
                        SideMenuItem(
                          title: 'menu.stores'.tr,
                          onTap: (index, _) {
                            sideMenu.changePage(index);
                            Get.offAndToNamed(Routes.stores);
                          },
                          iconWidget: SizedBox(
                            width: 16,
                          ),
                          icon: const Icon(Icons.storage),
                        ),
                      ],
                    ),
                    SideMenuExpansionItem(
                      title: "reports".tr,
                      icon: const Icon(Icons.kitchen),
                      children: [
                        SideMenuItem(
                          title: 'sales'.tr,
                          onTap: (index, _) {
                            sideMenu.changePage(index);
                            Get.offAndToNamed(Routes.sales);
                          },
                          iconWidget: SizedBox(
                            width: 16,
                          ),
                          icon: const Icon(Icons.shop),
                        ),
                      ],
                    ),
                    SideMenuItem(
                      title: 'log'.tr,
                      onTap: (index, _) {
                        sideMenu.changePage(index);
                        Get.offAndToNamed(Routes.logs);
                      },
                      icon: const Icon(Icons.ad_units),
                    ),
                    SideMenuItem(
                      builder: (context, displayMode) {
                        return const Divider(endIndent: 8, indent: 8);
                      },
                    ),
                    SideMenuItem(
                      title: 'menu.help'.tr,
                      onTap: (index, _) async {
                        // sideMenu.changePage(index);
                        await launchUrl(Uri.parse("https://sohu.com"));
                      },
                      icon: const Icon(Icons.help),
                    ),
                  ],
                ),
              ),
              const VerticalDivider(width: 0),
              Expanded(
                flex: 5,
                child: Container(
                  color: Colors.teal,
                  child: GetRouterOutlet(
                    initialRoute: Routes.dashboard,
                    anchorRoute: Routes.root,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

typedef ChangeThemeCallback = void Function(
    bool isMaterial3, Brightness brightness);

/// Show Right drawer which contains theme settings for web.
Widget buildWebThemeSettings(
  // SampleModel model,
  BuildContext context,
  ChangeThemeCallback refresh,
) {
  int selectedValue = 1; //model.selectedThemeIndex;
  return StatefulBuilder(
    builder: (context, setState) {
      final double width = MediaQuery.of(context).size.width * 0.4;
      final Color textColor = const Color.fromRGBO(84, 84, 84, 1);
      // model.themeData.colorScheme.brightness == Brightness.light
      //     ? const Color.fromRGBO(84, 84, 84, 1)
      //     : const Color.fromRGBO(218, 218, 218, 1);
      return Drawer(
        child: Container(
          color: Colors.black, // model.drawerBackgroundColor,
          padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
          child: Column(
            children: <Widget>[
              const Padding(padding: EdgeInsets.only(top: 15)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Settings',
                    style: TextStyle(
                      // color: model.themeData.colorScheme.onSurface,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto-Medium',
                    ),
                  ),
                  IconButton(
                    // color: model.themeData.colorScheme.onSurface,
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 25),
              if (MediaQuery.of(context).size.width < 1020)
                Align(
                  alignment: Alignment.centerLeft,
                  child: buildM2ToM3SwapOption(
                    // model,
                    context,
                    MainAxisSize.max,
                    textColor,
                    refresh,
                  ),
                ),
              if (MediaQuery.of(context).size.width < 1020)
                const SizedBox(height: 25),
              StatefulBuilder(
                builder: (context, setState) {
                  return CupertinoSegmentedControl<int>(
                    padding: EdgeInsets.zero,
                    children: <int, Widget>{
                      0: Container(
                        width: width,
                        padding: const EdgeInsets.symmetric(vertical: 12.5),
                        alignment: Alignment.center,
                        child: Text(
                          'Light theme',
                          style: TextStyle(
                            color: selectedValue == 0
                                ? Colors.amber // model.baseAppBarItemColor
                                : textColor,
                            fontFamily: 'Roboto-Medium',
                          ),
                        ),
                      ),
                      1: Container(
                        width: width,
                        alignment: Alignment.center,
                        child: Text(
                          'Dark theme',
                          style: TextStyle(
                            color: selectedValue == 1
                                ? Colors.amber //model.baseAppBarItemColor
                                : textColor,
                            fontFamily: 'Roboto-Medium',
                          ),
                        ),
                      ),
                    },
                    unselectedColor: Colors.transparent,
                    // selectedColor: model.primaryColor,
                    // pressedColor: model.primaryColor,
                    // borderColor: model.primaryColor,
                    groupValue: selectedValue,
                    onValueChanged: (int value) {
                      // setState(() {
                      //   selectedValue = value;
                      //   model.selectedThemeIndex = value;
                      //   final Brightness brightness =
                      //       value == 0 ? Brightness.light : Brightness.dark;
                      //   refresh(model.themeData.useMaterial3, brightness);
                      // });
                    },
                  );
                },
              ),
              const SizedBox(height: 25),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Theme colors',
                  style: TextStyle(
                    color: Color.fromRGBO(128, 128, 128, 1),
                    fontSize: 14,
                    fontFamily: 'Roboto-Regular',
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: _buildColorPalettes(
                        // model,
                        context,
                        selectedValue,
                        // refresh,
                        // setState,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

/// Adding the palette color in the theme setting panel.
List<Widget> _buildColorPalettes(
  // SampleModel model,
  BuildContext context,
  int selectedValue,
  // ChangeThemeCallback refresh,
  [
  StateSetter? setState,
]) {
  final List<Widget> colorPaletteWidgets = <Widget>[];
  // for (int i = 0; i < model.paletteColors.length; i++) {
  //   colorPaletteWidgets.add(
  //     Material(
  //       color: model.drawerBackgroundColor,
  //       child: DecoratedBox(
  //         decoration: BoxDecoration(
  //           color: Colors.transparent,
  //           border: model.paletteBorderColors.isNotEmpty &&
  //                   model.paletteBorderColorsM3.isNotEmpty
  //               ? Border.all(
  //                   color: model.themeData.useMaterial3
  //                       ? model.paletteBorderColorsM3[i]
  //                       : model.paletteBorderColors[i],
  //                   width: 2.0,
  //                 )
  //               : const Border(),
  //           shape: BoxShape.circle,
  //         ),
  //         child: InkWell(
  //           hoverColor: model.hoverColor,
  //           highlightColor: model.splashColor,
  //           splashColor: model.splashColor,
  //           borderRadius: BorderRadius.circular(20.0),
  //           onTap: () {
  //             selectedColorPaletteIndex = i;
  //             changeColorPalette(
  //               model,
  //               context,
  //               selectedValue,
  //               model.themeData.useMaterial3,
  //               refresh,
  //               setState,
  //             );
  //           },
  //           child: Icon(
  //             Icons.brightness_1,
  //             size: 40.0,
  //             color: model.themeData.useMaterial3
  //                 ? model.themeData.brightness == Brightness.light
  //                     ? model.paletteColorsM3[i]
  //                     : model.darkPaletteColorsM3[i]
  //                 : model.paletteColors[i],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
  return colorPaletteWidgets;
}

/// UI for switching m2 and m3.
Widget buildM2ToM3SwapOption(
  // SampleModel model,
  BuildContext context,
  MainAxisSize mainAxisSize,
  Color textColor,
  ChangeThemeCallback refresh,
) {
  final bool isMaterial3 = true;
  // model.themeData.useMaterial3;
  final Widget themeSwitch = SwitchTheme(
    data: SwitchThemeData(
      trackOutlineColor: WidgetStateProperty.resolveWith((states) {
        return states.contains(WidgetState.selected)
            ? Colors.amber // model.baseAppBarItemColor
            : null;
      }),
      trackOutlineWidth: WidgetStateProperty.resolveWith((states) {
        return 1.0;
      }),
    ),
    child: Switch(
      value: isMaterial3,
      onChanged: (bool value) {
        // changeColorPalette(
        //   model,
        //   context,
        //   model.themeData.brightness == Brightness.light ? 0 : 1,
        //   value,
        //   refresh,
        // );
      },
    ),
  );
  return SizedBox(
    height: 35,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: mainAxisSize,
      children: <Widget>[
        Text('Material 3', style: TextStyle(color: textColor)),
        if (isMaterial3) const SizedBox(width: 5),
        if (mainAxisSize == MainAxisSize.min)
          themeSwitch
        else
          Expanded(
            child: Align(alignment: Alignment.centerRight, child: themeSwitch),
          ),
      ],
    ),
  );
}
