import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preso_client/serverpod_client.dart';

import '../../../../services/auth_service.dart';
import '../../../routes/app_routes.dart';
import 'home_controller.dart';

class MenuItem {
  const MenuItem({
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;
}

var menus = <(String, IconData)>[
  ("Like", Icons.favorite),
  ("Share", Icons.share),
  ("Download", Icons.download),
  ("Cancel", Icons.cancel),
  ("Logout", Icons.logout),
  ("Login", Icons.login),
];

class MenuItems {
  static const List<MenuItem> firstItems = [like, share, download];
  static const List<MenuItem> secondItems = [cancel];

  static const like = MenuItem(text: 'Like', icon: Icons.favorite);
  static const share = MenuItem(text: 'Share', icon: Icons.share);
  static const download = MenuItem(text: 'Download', icon: Icons.download);
  static const cancel = MenuItem(text: 'Cancel', icon: Icons.cancel);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(
          item.icon,
          color: Colors.white,
          size: 22,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            item.text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  static void onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.like:
        //Do something
        break;
      case MenuItems.share:
        //Do something
        break;
      case MenuItems.download:
        //Do something
        break;
      case MenuItems.cancel:
        //Do something
        break;
    }
  }
}

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var sideMenu = controller.sideMenu;
    return GetRouterOutlet.builder(
      route: Routes.root,
      builder: (context) {
        return Scaffold(
          key: controller.scaffoldKey,
          appBar: AppBar(
            leading: Hero(tag: "logo", child: FlutterLogo()),
            // title: RouterListener(builder: (context) {
            //   final title = context.location;
            //   return Text(title);
            // }),
            centerTitle: true,
            actions: [
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
              DropdownButtonHideUnderline(
                child: DropdownButton2(
                  customButton: Icon(Icons.headphones_rounded),
                  // isExpanded: true,
                  items: [
                    ...MenuItems.firstItems.map(
                      (item) => DropdownMenuItem<MenuItem>(
                        value: item,
                        child: MenuItems.buildItem(item),
                      ),
                    ),
                    // const DropdownMenuItem<Divider>(
                    //     enabled: false, child: Divider()),
                    ...MenuItems.secondItems.map(
                      (item) => DropdownMenuItem<MenuItem>(
                        value: item,
                        child: MenuItems.buildItem(item),
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    // MenuItems.onChanged(context, value! as MenuItem);
                  },
                  // buttonStyleData: ButtonStyleData(
                  //   // This is necessary for the ink response to match our customButton radius.
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(56),
                  //   ),
                  // ),
                  dropdownStyleData: DropdownStyleData(
                    width: 160,
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    offset: const Offset(40, -8),
                  ),
                  // menuItemStyleData: MenuItemStyleData(
                  //   customHeights: [
                  //     ...List<double>.filled(MenuItems.firstItems.length, 48),
                  //     8,
                  //     ...List<double>.filled(MenuItems.secondItems.length, 48),
                  //   ],
                  //   padding: const EdgeInsets.only(left: 16, right: 16),
                  // ),
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
                  items: [
                    SideMenuItem(
                      title: 'dashboard'.tr,
                      onTap: (index, _) {
                        sideMenu.changePage(index);
                        Get.offAndToNamed(Routes.dashboard);
                      },
                      icon: const Icon(Icons.dashboard),
                    ),
                    SideMenuItem(
                      title: 'members'.tr,
                      onTap: (index, _) {
                        sideMenu.changePage(index);
                        Get.offAndToNamed(Routes.members);
                      },
                      icon: const Icon(Icons.account_box),
                    ),
                    SideMenuItem(
                      title: 'tenants'.tr,
                      onTap: (index, _) {
                        sideMenu.changePage(index);
                        Get.offAndToNamed(Routes.tanents);
                      },
                      icon: const Icon(Icons.supervisor_account),
                    ),
                    SideMenuItem(
                      title: 'orders'.tr,
                      onTap: (index, _) {
                        sideMenu.changePage(index);
                        Get.offAndToNamed(Routes.orders);
                      },
                      icon: const Icon(Icons.battery_unknown),
                    ),
                    SideMenuExpansionItem(
                      title: "Expansion Item",
                      icon: const Icon(Icons.kitchen),
                      onTap: (index, _, isExpanded) =>
                          {print('$index, expanded $isExpanded')},
                      children: [
                        SideMenuItem(
                          title: 'Expansion Item 1',
                          onTap: (index, _) {
                            sideMenu.changePage(index);
                          },
                          iconWidget: SizedBox(
                            width: 16,
                          ),
                          // icon: const Icon(Icons.home),
                          badgeContent: const Text(
                            '3',
                            style: TextStyle(color: Colors.white),
                          ),
                          tooltipContent: "Expansion Item 1",
                        ),
                        SideMenuItem(
                          title: 'Expansion Item 2',
                          onTap: (index, _) {
                            sideMenu.changePage(index);
                          },
                          icon: const Icon(Icons.supervisor_account),
                        )
                      ],
                    ),
                    SideMenuItem(
                      title: 'Download',
                      onTap: (index, _) {
                        sideMenu.changePage(index);
                      },
                      icon: const Icon(Icons.download),
                    ),
                    SideMenuItem(
                      builder: (context, displayMode) {
                        return const Divider(endIndent: 8, indent: 8);
                      },
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
