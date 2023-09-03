import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_color.dart';
import '../../model/companys_model.dart';

class ShowStand extends StatelessWidget {
  final CompanyPost item;

  const ShowStand({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    if (item.title.toLowerCase() == 'offre') {
      return Container();
    } else {
      return GestureDetector(
        onTap: () {
          // debugPrint(item.name);
          Get.toNamed('/specific_announcement_company', arguments: item);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              color: const Color(0xFFEBF3FA),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 8.0),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Company name',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Text(
                            'De ${item.startDate.day} ${item.startDate.month} à ${item.endDate.day} ${item.endDate.month}',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ),
                    subtitle: const Text(
                      'Publié il y’a 15 heures',
                      style: TextStyle(
                        color: LightThemeColor.lightGrey,
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ),
                    ),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child:
                          Image.asset('assets/images/companyLogo-default.png'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
