import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/routes/routes.dart';
import 'src/utils/mybindings.dart';
import 'src/controller/app_controller.dart';

final AppController controller = Get.put(AppController());
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Job It Day',
      debugShowCheckedModeBanner: false,
      initialBinding: MyBindings(),
      theme: controller.theme,
      initialRoute: Routes.initial,
      getPages: Routes.routes,
    );
  }
}
