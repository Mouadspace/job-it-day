import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/test_controller.dart';

int counter = 0;

class TestScreen extends StatelessWidget {
  TestScreen({super.key});

  final TestController controller = Get.put(TestController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Obx(() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () => {controller.increment()},
                icon: const Icon(Icons.add)),
            Text('${controller.counter.value}'),
            IconButton(
                onPressed: () => {controller.decrement()},
                icon: const Icon(Icons.remove))
          ],
        );
      }),
    ));
  }
}
