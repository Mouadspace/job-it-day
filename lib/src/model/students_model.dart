class StudentModel {
  String name;
  String educationGrade;
  String imagePath;
  String beginningTitle;
  BlueBarButton blueBarButtons;
  List<Experience>? experiences;
  List<Skill>? skills;

  StudentModel({
    required this.name,
    required this.educationGrade,
    required this.imagePath,
    required this.beginningTitle,
    required this.blueBarButtons,
    this.experiences,
    this.skills,
  });
}

// BlueBarButton
class BlueBarButton {
  final String buttonText = 'CONSULTER CV';
  final void Function() buttonClicked;

  BlueBarButton({
    required this.buttonClicked,
  });
}

// for Experiences
class Experience {
  String companyName;
  String companyLogo;
  String position;
  List<ExperienceData>
      date; // ExperienceData has the start and the end of the intership

  Experience({
    required this.companyName,
    required this.companyLogo,
    required this.position,
    required this.date,
  });
}

class ExperienceData {
  final String month;
  final int year;

  ExperienceData({
    required this.month,
    required this.year,
  });
}

// ---------------

// If it happened that we have the necessary data,
// we'll be having the experiences table as follow:

// -- Some ideas on how to get the data in SQL
// In SQL for exmaple, all we have to do is Group By id_student.
// The order, id from the newest experieces to the latest,
// means if the Experience table has and id_experience,
// we're going to order it by the hightest id_exper to the lowest
// --
List<Experience> experiences = [
  Experience(
    companyName: 'Microsoft',
    companyLogo: 'assets/images/companyLogo-Microsoft.png',
    position: 'Banckend-dev',
    date: [
      ExperienceData(month: 'September', year: 2022),
      ExperienceData(month: 'November', year: 2022),
    ],
  ),
  Experience(
    companyName: 'Capgemini',
    companyLogo: 'assets/images/companyLogo-Compgemini.png',
    position: 'Stage d\'initiation',
    date: [
      ExperienceData(month: 'Janvier', year: 2022),
      ExperienceData(month: 'Aout', year: 2022),
    ],
  ),
  Experience(
    companyName: 'Company IT',
    companyLogo: 'assets/images/companyLogo-default.png',
    position: 'Stage d\'observation',
    date: [
      ExperienceData(month: 'December', year: 2021),
      ExperienceData(month: 'Janvier', year: 2022),
    ],
  ),
];

// // If it happened that we have the necessary data,
// we'll be having the experiences table as follow:

// Start for Skills

// Contructing the class (Skill)
class Skill {
  String skillName;
  String skillSource;
  String skillImage;

  Skill({
    required this.skillName,
    required this.skillSource,
    required this.skillImage,
  });
}
// -----------------------------

// Skills Exmaple Table
List<Skill> skills = [
  Skill(
    skillName: 'JavaScript',
    skillSource: 'Certificat du coursera',
    skillImage: 'assets/images/skill_image_1.png',
  ),
  Skill(
    skillName: 'Java',
    skillSource: 'Stagiaire en CampanieA IT',
    skillImage: 'assets/images/skill_image_2.png',
  ),
  Skill(
    skillName: 'Leadership',
    skillSource: 'Chef du GrpA',
    skillImage: 'assets/images/skill_image_default.png',
  ),
];

// --------------------

// End for Skills

List<StudentModel> studentsList = [
  StudentModel(
    name: 'Oubayhe Otmane',
    educationGrade: 'CI2, Génie Informatique',
    imagePath: 'assets/images/default-student-image.png',
    beginningTitle: "A la recherche d'un stage PFA",
    blueBarButtons: BlueBarButton(buttonClicked: () {}),
    experiences: experiences,
    skills: skills,
  ),
  StudentModel(
    name: 'Saif Mouad',
    educationGrade: 'CI2, Génie Informatique',
    imagePath: 'assets/images/default-student-image.png',
    beginningTitle: "A la recherche d'un stage d'application",
    blueBarButtons: BlueBarButton(buttonClicked: () {}),
    experiences: experiences,
    skills: skills,
  ),
  StudentModel(
    name: 'Laarbi Ilham',
    educationGrade: 'CI2, Génie Mechatronics',
    imagePath: 'assets/images/ilhamLaarbi.jpg',
    beginningTitle: "A la recherche d'un stage PFE",
    blueBarButtons: BlueBarButton(buttonClicked: () {}),
    experiences: experiences,
    skills: skills,
  ),
  StudentModel(
    name: 'Tabchi Yassine',
    educationGrade: 'CI2, Génie Mechatronics',
    imagePath: 'assets/images/yassineTabchi.jpg',
    beginningTitle: "A la recherche d'un stage d'initiation",
    blueBarButtons: BlueBarButton(buttonClicked: () {}),
    experiences: experiences,
    skills: skills,
  ),
  StudentModel(
    name: 'Bouhouch Yassine',
    educationGrade: 'CI2, Génie Industrielle',
    imagePath: 'assets/images/default-student-image.png',
    beginningTitle: "A la recherche d'un stage PFA",
    blueBarButtons: BlueBarButton(buttonClicked: () {}),
    experiences: experiences,
    skills: skills,
  ),
  StudentModel(
    name: 'El Omari Imane',
    educationGrade: 'CI2, Génie Informatique',
    imagePath: 'assets/images/imaneElOmari.jpg',
    beginningTitle: "A la recherche d'un stage d'application",
    blueBarButtons: BlueBarButton(buttonClicked: () {}),
    experiences: experiences,
    skills: skills,
  ),
  StudentModel(
    name: 'El Omari Imane',
    educationGrade: 'CI2, Génie Informatique',
    imagePath: 'assets/images/imaneElOmari.jpg',
    beginningTitle: "A la recherche d'un stage PFA",
    blueBarButtons: BlueBarButton(buttonClicked: () {}),
    experiences: experiences,
    skills: skills,
  ),
  StudentModel(
    name: 'El Omari Imane',
    educationGrade: 'CI2, Génie Informatique',
    imagePath: 'assets/images/imaneElOmari.jpg',
    beginningTitle: "A la recherche d'un stage PFA",
    blueBarButtons: BlueBarButton(buttonClicked: () {}),
    experiences: experiences,
    skills: skills,
  ),
  StudentModel(
    name: 'El Omari Imane',
    educationGrade: 'CI2, Génie Informatique',
    imagePath: 'assets/images/imaneElOmari.jpg',
    beginningTitle: "A la recherche d'un stage PFA",
    blueBarButtons: BlueBarButton(buttonClicked: () {}),
    experiences: experiences,
    skills: skills,
  ),
];
