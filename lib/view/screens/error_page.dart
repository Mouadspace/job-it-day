import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SomethingWrong extends StatelessWidget {
  SomethingWrong({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ErrorPage(),
    );
  }
}

class ErrorPage extends StatefulWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/svgs/error.svg",
                height: 149,
                width: 149,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "OH NO ...",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(176, 0, 32, 1.0),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Quelque chose s\'est mal passé.\n Essayer encore un fois",
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                child: Text(
                  'Réessayer',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                color: Color.fromRGBO(176, 0, 32, 1.0),
                textColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
