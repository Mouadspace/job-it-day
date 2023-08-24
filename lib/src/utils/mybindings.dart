import 'package:get/get.dart';
import '../controller/side_bar_controller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    // ALL DEPENDENCIES INJECTION
    Get.lazyPut(() => SideBarController(), fenix: true);
  }
}
