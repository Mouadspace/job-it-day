import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jobitday/view/screens/company-screens/offers.dart';
import 'package:jobitday/view/screens/company-screens/students.dart';

import '../../../controller/side_bar_controller.dart';
import 'profile.dart';
import 'dashboard.dart';
import 'settings.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen({super.key});

  final SideBarController controller = Get.find();

  final List<DrawerItems> drawerItems = [
    DrawerItems(
      icon: SvgPicture.asset('assets/svgs/home.svg'),
      label: 'Profile',
      screen: const Profile(),
    ),
    DrawerItems(
      icon: SvgPicture.asset('assets/svgs/dashboard.svg'),
      label: 'Dashboard',
      screen: const Dashboard(),
    ),
    DrawerItems(
      icon: SvgPicture.asset('assets/svgs/students-group.svg'),
      label: 'Etudiants',
      screen: const Students(),
    ),
    DrawerItems(
      icon: SvgPicture.asset('assets/svgs/offres.svg'),
      label: 'Offres',
      screen: const Offers(),
    ),
    DrawerItems(
      icon: SvgPicture.asset('assets/svgs/settings.svg'),
      label: 'Settings',
      screen: const Settings(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 80,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => controller.openDrawer(),
          child: Transform.translate(
            offset: const Offset(20, 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/oracle-test.png',
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView.builder(
            itemCount: drawerItems.length + 1,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              if (index == 0) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    dividerTheme:
                        const DividerThemeData(color: Colors.transparent),
                  ),
                  child: _buildDrawerHeader(),
                );
              } else {
                int id = index - 1;
                return Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListTile(
                    leading: drawerItems[id].icon,
                    title: Text(
                      drawerItems[id].label,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    onTap: () {
                      controller.updateScreen(id);
                    },
                  ),
                );
              }
            }),
      ),
      body: GetBuilder<SideBarController>(builder: (controller) {
        return drawerItems[controller.currentScreen].screen;
      }),
    );
  }

  DrawerHeader _buildDrawerHeader() {
    return DrawerHeader(
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(40),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            'assets/images/oracle-test.png',
          ),
        ),
      )),
    );
  }
}

class DrawerItems {
  SvgPicture icon;
  String label;
  Widget screen;

  DrawerItems({
    required this.icon,
    required this.label,
    required this.screen,
  });
}
