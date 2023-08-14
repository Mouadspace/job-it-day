import 'package:get/get.dart';

// What is this page for?
//Whay are we incrementing and descriminting the counter?
//Why is the type is RxInt, and what does it do?
//Which page is this being applyed?
class TestController extends GetxController {
  RxInt counter = 0.obs;
  void increment() {
    counter++;
  }

  void decrement() {
    if (counter > 0) {
      counter--;
    }
  }
}
// Just testing, not used in the main files.
