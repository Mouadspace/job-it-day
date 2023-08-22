import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => Get.back(),
        child: Stack(children: [
          CircleAvatar(
              backgroundColor: Colors.transparent,
              child: SvgPicture.asset('assets/svgs/back-arrow.svg')),
        ]));
  }
}
