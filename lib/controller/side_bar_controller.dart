import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideBarController extends GetxController {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentScreen = 0;

  void updateScreen(int index) {
    _currentScreen = index;
    closeDrawer();
    update();
  }

  void openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  void closeDrawer() {
    _scaffoldKey.currentState!.closeDrawer();
  }

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  int get currentScreen => _currentScreen;
}
