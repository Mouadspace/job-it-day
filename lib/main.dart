import 'package:flutter/material.dart';

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
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
          primary: const Color(0xff1864ab),
          secondary: const Color(0xffab5f18),
        ),
      ),
      home: const OnBording(),
    );
  }
}
