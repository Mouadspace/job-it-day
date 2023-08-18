import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InscriptionDone extends StatelessWidget {
  const InscriptionDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/svgs/check-icon.svg",
                height: 149,
                width: 149,
              ),
              const SizedBox(height: 30),
              const Text(
                "C'est Bien Fait!",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(24, 100, 171, 1.0),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Félicitations, votre compte a été",
                style: TextStyle(fontSize: 16.0),
              ),
              const Text(
                "créé avec succès",
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 50,
                child: MaterialButton(
                  color: const Color.fromRGBO(24, 100, 171, 1.0),
                  textColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  onPressed: () {
                    // Enters to the personal profile weather it's a company or a student
                  },
                  child: const Text(
                    'Suivant',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
