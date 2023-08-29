import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../model/students_model.dart';
import '../../widgets/custom_profile_introduction.dart';
import '../../widgets/experience_card.dart';
import '../../widgets/skill_card.dart';

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
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          CustomProfileIntroduction(
            profileTitle: exampleStudent.name,
            profileSubTitle: exampleStudent.educationGrade,
            profileImage: exampleStudent.imagePath,
            profileBeginningTitle: exampleStudent.beginningTitle,
            profileButtonText: exampleStudent.blueBarButtons.buttonText,
          ),
          // For posts (Annonces)
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Experiences',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SvgPicture.asset('assets/svgs/right-arrow.svg'),
              ],
            ),
          ),
          ListView.builder(
            // I want this to be scrolled horizontally
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
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
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Skills',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SvgPicture.asset('assets/svgs/right-arrow.svg'),
                // The icon will be used when the horizontal scrolling is done perfectly.
              ],
            ),
          ),
          ListView.builder(
            // I want this to be scrolled horizontally
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
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
    );
  }
}
