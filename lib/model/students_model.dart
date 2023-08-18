class StudentModel {
  String name;
  String educationGrade;
  String? imagePath = 'assets/images/default-student-image.png';

  StudentModel({
    required this.name,
    required this.educationGrade,
    this.imagePath,
  });
}

List<StudentModel> studentsList = [
  StudentModel(
    name: 'Oubayahe Otmane',
    educationGrade: 'CI2, Génie Informatique',
    imagePath: 'assets/images/default-student-image.png',
  ),
  StudentModel(
    name: 'Saif Mouad',
    educationGrade: 'CI2, Génie Informatique',
    imagePath: 'assets/images/default-student-image.png',
  ),
  StudentModel(
    name: 'Laarbi Ilham',
    educationGrade: 'CI2, Génie Mechatronics',
    imagePath: 'assets/images/ilhamLaarbi.jpg',
  ),
  StudentModel(
    name: 'Tabchi Yassine',
    educationGrade: 'CI2, Génie Mechatronics',
    imagePath: 'assets/images/yassineTabchi.jpg',
  ),
  StudentModel(
    name: 'Bouhouch Yassine',
    educationGrade: 'CI2, Génie Industrielle',
    imagePath: 'assets/images/default-student-image.png',
  ),
  StudentModel(
    name: 'El Omari Imane',
    educationGrade: 'CI2, Génie Informatique',
    imagePath: 'assets/images/imaneElOmari.jpg',
  ),
  StudentModel(
    name: 'El Omari Imane',
    educationGrade: 'CI2, Génie Informatique',
    imagePath: 'assets/images/imaneElOmari.jpg',
  ),
  StudentModel(
    name: 'El Omari Imane',
    educationGrade: 'CI2, Génie Informatique',
    imagePath: 'assets/images/imaneElOmari.jpg',
  ),
  StudentModel(
    name: 'El Omari Imane',
    educationGrade: 'CI2, Génie Informatique',
    imagePath: 'assets/images/imaneElOmari.jpg',
  ),
];
