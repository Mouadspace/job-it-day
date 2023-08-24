import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SomethingWrong extends StatelessWidget {
  const SomethingWrong({super.key});

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
                "assets/svgs/error.svg",
                height: 149,
                width: 149,
              ),
              const SizedBox(height: 30),
              const Text(
                "OH NO ...",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(176, 0, 32, 1.0),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Quelque chose s'est mal passé.",
                style: TextStyle(fontSize: 16.0),
              ),
              const Text(
                "essayons encore",
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                child: MaterialButton(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  height: 0,
                  color: const Color(0xffB00020),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Réessayer',
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
