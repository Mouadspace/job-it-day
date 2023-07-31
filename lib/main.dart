import 'package:flutter/material.dart';

import '../screens/user_type.dart';
import '../screens/onbording.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job It Day',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color(0xff212529),
          ),
        ),
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
          primary: const Color(0xff1864ab),
          secondary: const Color(0xffab5f18),
        ),
      ),
      initialRoute: '/onbording',
      routes: {
        "/onbording": (context) => const OnBording(),
        "/user": (context) => const UserType(),
      },
      home: const OnBording(),
    );
  }
}
