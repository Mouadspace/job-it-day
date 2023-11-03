import 'package:get/get.dart';

import '../view/screens/company-screens/base_screen.dart';
import '../view/screens/company-screens/edit_profile.dart';
import '../view/screens/auth/sign_up.dart';
import '../view/screens/company-screens/see_all_posts.dart';
import '../view/screens/company-screens/specific_annoucement_company.dart';
import '../view/screens/contact_us.dart';
import '../view/screens/company-screens/student_profile.dart';
import '../view/screens/onBoarding/base_screen.dart';
import '../view/screens/student_screens/all_company_posts_to_students.dart';
import '../view/screens/student_screens/personal_student_profile.dart';
import '../view/screens/student_screens/see_all_companies.dart';
import '../view/screens/student_screens/show_specific_post_to_student.dart';
import '../view/screens/test_screen.dart';
import '../view/screens/auth/sign_in.dart';
import '../view/screens/user_type.dart';
import '../view/screens/onbording.dart';
import '../view/screens/onBoarding/ensak_en_chiffre.dart';
import '../view/screens/company-screens/students.dart';
import '../view/screens/flash-message/error_page.dart';
import '../view/screens/flash-message/success_page.dart';

class Routes {
  Routes._();
  static const initial = '/';

  static final routes = [
    GetPage(name: '/', page: () => OnBording()),
    GetPage(name: "/user", page: () => const UserType()),
    GetPage(name: "/signin", page: () => const SignIn()),
    GetPage(name: "/base_screen", page: () => const OnboardingScreen()),
    GetPage(name: "/signup", page: () => const SignUp()),
    GetPage(name: "/test", page: () => TestScreen()),
    GetPage(name: "/ensak_en_chiffre", page: () => const EnsakChiffre()),
    GetPage(name: "/contact_us", page: () => const ContactUs()),
    GetPage(name: "/students", page: () => const Students()),
    GetPage(name: "/student_profile", page: () => const StudentProfile()),
    // GetPage(name: "/", page: () => const StudentProfile()),
    GetPage(name: "/error_page", page: () => const SomethingWrong()),
    GetPage(name: "/success_page", page: () => const InscriptionDone()),
    GetPage(name: "/base", page: () => BaseScreen()),
    // GetPage(name: "/", page: () => BaseScreen()),
    GetPage(name: "/edit_profile", page: () => EditProfile()),
    // GetPage(name: "/see_all_posts", page: () => const SeeAllPosts()),
    GetPage(
        name: "/specific_announcement_company",
        page: () => const ShowSpecificCompanyPost()),
    GetPage(
        name: "/specific_post_to_student",
        page: () => const ShowSpecificPost()),
    GetPage(
        name: "/show_all_companys_posts_to_student",
        page: () => const ShowAllCompanyPostsToStudent()),
    GetPage(
        name: "/show_all_companies_to_student", page: () => const Companies()),
    GetPage(
        name: "/personal_student_profile",
        page: () => const PersonalStudentProfile()),
    // GetPage(name: "/posts", page: () => const SeeAllPosts()),
    // GetPage(name: "/", page: () => const SeeAllPosts()),
  ];
}
