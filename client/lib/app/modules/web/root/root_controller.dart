import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
}
