import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../model/companys_model.dart';
import '../../../core/app_asset.dart';

class CompanyCard extends StatelessWidget {
  const CompanyCard({
    super.key,
    required this.item,
  });

  final CompanyModel item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint(item.companyName);
        Get.toNamed('/company_profile', arguments: item);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            color: const Color(0xFFE3F1FA),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.only(left: 20.0, top: 8.0, bottom: 8.0),
              title: Text(
                item.companyName,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  item.companyEmail,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  item.companyImage!,
                  width: 45,
                  height: 45,
                ),
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: SvgPicture.asset(AppAsset.rightArrow),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
