import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/companys_model.dart';

class AnnouncementCard extends StatelessWidget {
  final CompanyPost item;
  final int type;

  const AnnouncementCard({
    super.key,
    required this.item,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    // If we're going to show an offre, the type is 1.
    if ((item.title.toLowerCase() == 'offre') && (type == 1)) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.offerPosition!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // debugPrint(item.name);
                          Get.toNamed('/see_all_applicants_of_offre',
                              arguments: item);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFFEC1B2E).withOpacity(0.5),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(100))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Row(
                              children: [
                                const Text(
                                  'Condidats',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  height: 25,
                                  width: 25,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFEC1B2E),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      item.applicants.toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'De ${item.startDate.day} ${item.startDate.month} à ${item.endDate.day} ${item.endDate.month}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          // This Text below is not centered which is good
                          Text(
                            item.description,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      );
    } else if ((item.title.toLowerCase() == 'stande') && (type == 2)) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
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
                  title: Text(
                    item.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'De ${item.startDate.day} ${item.startDate.month} à ${item.endDate.day} ${item.endDate.month}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          // This Text below is not centered which is good
                          Text(
                            item.description,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
