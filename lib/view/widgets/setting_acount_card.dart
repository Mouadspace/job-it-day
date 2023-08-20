import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../screens/company-screens/settings.dart';

class SettingAcountCard extends StatelessWidget {
  final AcountSetting item;
  const SettingAcountCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint(item.label);
        Get.toNamed('/edit_profile');
      },
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: const Color(0xffF8F9FA),
          borderRadius: BorderRadius.circular(12),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              color: const Color(0xffE3F1FA),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SvgPicture.asset('assets/svgs/${item.iconName}'),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                item.label,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SvgPicture.asset('assets/svgs/right-arrow.svg'),
          ),
        ]),
      ),
    );
  }
}
