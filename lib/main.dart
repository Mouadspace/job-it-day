import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'utils/mybindings.dart';
import 'view/screens/unknown-route/unknow_page.dart';
import 'view/screens/auth/sign_up.dart';
import 'view/screens/test_screen.dart';
import 'view/screens/auth/sign_in.dart';
import 'view/screens/user_type.dart';
import 'view/screens/onbording.dart';
import 'view/screens/ensak_en_chiffre.dart';
import 'view/screens/chercher_etudiant.dart';
import 'view/screens/error_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color greyColor = Color(0xff495057);
    const Color primaryColor = Color(0xff1864ab);
    const Color secondaryColor = Color(0xffab5f18);

    const FontWeight semiBold = FontWeight.w600;

    return GetMaterialApp(
      title: 'Job It Day',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        textTheme: const TextTheme(
          labelLarge: TextStyle(
            color: greyColor,
            fontSize: 18,
          ),
          labelSmall: TextStyle(
            fontSize: 16,
            color: greyColor,
          ),
          titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: semiBold,
            color: greyColor,
          ),
          titleMedium: TextStyle(
            fontSize: 20,
            fontWeight: semiBold,
            color: greyColor,
          ),
        ),
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
          primary: primaryColor,
          secondary: secondaryColor,
        ),
      ),
      initialBinding: MyBindings(), // what is this propertity "initialBinding"?
      // not important! ^^^^^^^ At the moment.
      initialRoute: '/', // Same here for the propertity?
      // the main is '/',
      unknownRoute: GetPage(name: '/notfound', page: () => const UnknownPage()),
      // What are we exactly doing above?

      // Down here, look for the one in the matirial package.
      // Answer:
      // routes: {
      //   'String': (context) => const SignIn(),
      // },
      getPages: [
        // GetPage(name: '/', page: () => const OnBording()),
        GetPage(name: "/user", page: () => const UserType()),
        GetPage(name: "/signin", page: () => const SignIn()),
        GetPage(name: "/signup", page: () => const SignUp()),
        GetPage(name: "/test", page: () => TestScreen()),
        GetPage(name: "/ensak_en_chiffre", page: () => EnsakChiffre()),
        GetPage(name: "/profile_etudiant", page: () => SearchStudent()),
        // GetPage(name: "/error_page", page: () => SomethingWrong()),
        GetPage(name: "/", page: () => SomethingWrong()),
      ],
    );
  }
}
