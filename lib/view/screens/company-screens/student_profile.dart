import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/students_model.dart';
import '../../widgets/custom_profile_introduction.dart';
import '../../widgets/experience_card.dart';
import '../../widgets/skill_card.dart';

class StudentProfile extends StatelessWidget {
  const StudentProfile({super.key});

  // void Function() directToEmail() {}

  @override
  Widget build(BuildContext context) {
    StudentModel student = Get.arguments;
    List<Experience>? studentExperiences = student.experiences;
    List<Skill>? studentSkills = student.skills;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomProfileIntroduction(
              profileTitle: student.name,
              profileSubTitle: student.educationGrade,
              profileImage: student.imagePath,
              profileBeginningTitle: student.beginningTitle,
              profileButtonText: student.blueBarButtons.buttonText,
              // profileButtonClicked: directToEmail(),
            ),
            // For posts (Annonces)
            // const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Experiences',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: studentExperiences?.length ?? 0,
              itemBuilder: (context, index) {
                if (studentExperiences != null) {
                  return ExperienceCard(item: studentExperiences[index]);
                } else {
                  return Container();
                }
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Skills',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: studentSkills?.length ?? 0,
              itemBuilder: (context, index) {
                if (studentSkills != null) {
                  return SkillCard(item: studentSkills[index]);
                } else {
                  return Container();
                }
              },
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
