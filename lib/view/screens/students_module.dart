// here we will be writing the student data model class
// just to have an exmple of how the page will work

// Say that name is full student's name
// and education grade is the year (ci1, cp2...) and the measure (info, méca...)
class StudentModel {
  String? student_name;
  String? student_education_grade;
  // We might need to add the url of the student profile, or something
  // that will direct the user to the student profile
  // this is below is the path to the student's profile photo:
  String? student_image_path;

  StudentModel(
      this.student_name, this.student_education_grade, this.student_image_path);
}
