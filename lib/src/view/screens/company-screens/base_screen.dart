import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/app_data.dart';
import '../../../controller/side_bar_controller.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen({super.key});

  final SideBarController controller = Get.find();

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
            itemCount: AppData.drawerItems.length + 1,
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
                    leading: AppData.drawerItems[id].icon,
                    title: Text(
                      AppData.drawerItems[id].label,
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
        return AppData.drawerItems[controller.currentScreen].screen;
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
