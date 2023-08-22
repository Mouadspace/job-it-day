import 'package:flutter/material.dart';

import '../../model/students_model.dart';
import '../widgets/custom_profile_introduction.dart';
import '../widgets/experience_card.dart';
import '../widgets/skill_card.dart';

class StudentProfile extends StatelessWidget {
  const StudentProfile({super.key});

  // void Function() directToEmail() {}

  @override
  Widget build(BuildContext context) {
    // Here we just taking an example from the students_model
    // Which should be given from the api which the neccessary data
    List<StudentModel> displayList = List.from(studentsList);
    StudentModel exampleStudent = displayList[1];
    List<Experience>? exampleStudentExperiences = exampleStudent.experiences;
    List<Skill>? exampleStudentSkills = exampleStudent.skills;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomProfileIntroduction(
              profileTitle: exampleStudent.name,
              profileSubTitle: exampleStudent.educationGrade,
              profileImage: exampleStudent.imagePath,
              profileBeginningTitle: exampleStudent.beginningTitle,
              profileButtonText: exampleStudent.blueBarButtons.buttonText,
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
              itemCount: exampleStudentExperiences?.length ?? 0,
              itemBuilder: (context, index) {
                if (exampleStudentExperiences != null) {
                  return ExperienceCard(item: exampleStudentExperiences[index]);
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
              itemCount: exampleStudentSkills?.length ?? 0,
              itemBuilder: (context, index) {
                if (exampleStudentSkills != null) {
                  return SkillCard(item: exampleStudentSkills[index]);
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
