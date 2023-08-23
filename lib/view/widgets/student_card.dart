import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/students_model.dart';

class StudentCard extends StatelessWidget {
  const StudentCard({
    super.key,
    required this.item,
  });

  final StudentModel item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint(item.name);
        Get.toNamed('/student_profile', arguments: item);
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
                item.name,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  item.educationGrade,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  item.imagePath,
                  width: 45,
                  height: 45,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
