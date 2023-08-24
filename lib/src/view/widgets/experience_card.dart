import 'package:flutter/material.dart';

import '../../model/students_model.dart';

class ExperienceCard extends StatelessWidget {
  final Experience item;
  const ExperienceCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          color: const Color(0xFFEBF3FA),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding:
                    const EdgeInsets.only(left: 10.0, top: 8.0, bottom: 8.0),
                title: Text(
                  item.position,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0),
                      child: Text(
                        item.companyName,
                        style: const TextStyle(
                          color: Color(0xFF767a7d),
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        '${item.date[0].month} ${item.date[0].year} - ${item.date[1].month} ${item.date[1].year}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(item.companyLogo),
                ),
                // fix the width and height
              ),
            ],
          ),
        ),
      ),
    );
  }
}
