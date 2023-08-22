import 'package:get/get.dart';
import 'package:jobitday/controller/side_bar_controller.dart';

//What????
class MyBindings implements Bindings {
  @override
  void dependencies() {
    // ALL DEPENDENCIES INJECTION
    Get.lazyPut(() => SideBarController(), fenix: true);
  }
}
