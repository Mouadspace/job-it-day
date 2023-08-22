import 'package:flutter/material.dart';

import '../../model/companys_model.dart';

class AnnouncementCard extends StatelessWidget {
  final CompanyPost item;

  const AnnouncementCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
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
                contentPadding:
                    const EdgeInsets.only(left: 20.0, top: 8.0, bottom: 8.0),
                title: Text(
                  item.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'De ${item.startDate.day} ${item.startDate.month} à ${item.endDate.day} ${item.endDate.month}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                isThreeLine: true,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
                child: Text(
                  item.description,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}