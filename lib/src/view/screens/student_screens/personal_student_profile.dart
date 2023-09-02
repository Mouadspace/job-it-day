import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/app_asset.dart';
import '../../../../core/app_color.dart';
import '../../../model/students_model.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_input.dart';
import '../../widgets/custom_profile_introduction.dart';
import '../../widgets/experience_card.dart';
import '../../widgets/skill_card.dart';

class PersonalStudentProfile extends StatelessWidget {
  const PersonalStudentProfile({super.key});

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: MaterialButton(
              minWidth: 50,
              height: 100,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              color: LightThemeColor.lightBlueBG,
              textColor: const Color(0xFF1864AB),
              elevation: 0,
              onPressed: () {
                // Show the add Experience form
                showModalBottomSheet(
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    )),
                    context: context,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 25.0,
                        ),
                        child: SizedBox(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 20.0),
                              Text(
                                'Ajouter une expérience',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 70.0),
                              const CustomInput(
                                hintText: "Titre de l'expérience",
                              ),
                              const SizedBox(height: 20),
                              const CustomInput(
                                hintText: "Image (ex: image d'une agence)",
                              ),
                              const SizedBox(height: 20),
                              const CustomInput(
                                hintText: "Date du début de l'expérience",
                              ),
                              const SizedBox(height: 20),
                              const CustomInput(
                                hintText: "Date du fin de l'expérience",
                              ),
                              const SizedBox(height: 50),
                              CustomButton(
                                  outline: false,
                                  text: 'AJOUTER EXPERIENCE',
                                  onTabHandler: () {
                                    // Add the expérience to the student.
                                  })
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: SvgPicture.asset(
                AppAsset.addIcon,
              ),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: MaterialButton(
              minWidth: 50,
              height: 75,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              color: LightThemeColor.lightBlueBG,
              textColor: const Color(0xFF1864AB),
              elevation: 0,
              onPressed: () {
                // Show the add Skill form
                showModalBottomSheet(
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    )),
                    context: context,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 25.0,
                        ),
                        child: SizedBox(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 20.0),
                              Text(
                                'Ajouter une skill',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 110.0),
                              const CustomInput(
                                hintText: "Titre de l'expérience",
                              ),
                              const SizedBox(height: 20),
                              const CustomInput(
                                hintText: "Image",
                              ),
                              const SizedBox(height: 20),
                              const CustomInput(
                                hintText: "Source d'apprentisage",
                              ),
                              const SizedBox(height: 100),
                              CustomButton(
                                  outline: false,
                                  text: 'AJOUTER SKILL',
                                  onTabHandler: () {
                                    // Add the skill to the student.
                                  })
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: SvgPicture.asset(
                AppAsset.addIcon,
              ),
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
