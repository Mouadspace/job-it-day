import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InscriptionDone extends StatelessWidget {
  InscriptionDone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SuccessPage(),
    );
  }
}

class SuccessPage extends StatefulWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
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
                "assets/svgs/check-icon.svg",
                height: 149,
                width: 149,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "C\'est Bien Fait!",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(24, 100, 171, 1.0),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Félicitations, votre compte a été",
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                "créé avec succès",
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                child: Text(
                  'Suivant',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                color: Color.fromRGBO(24, 100, 171, 1.0),
                textColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                onPressed: () {
                  // Enters to the personal profile weather it's a company or a student
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
