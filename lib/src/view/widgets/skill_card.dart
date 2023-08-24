import 'package:flutter/material.dart';

import '../../model/students_model.dart';

class SkillCard extends StatelessWidget {
  final Skill item;
  const SkillCard({
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
                  item.skillName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Text(
                    item.skillSource,
                    style: const TextStyle(
                      color: Color(0xFF767a7d),
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                  ),
                ),
                leading: Image.asset(item.skillImage),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
