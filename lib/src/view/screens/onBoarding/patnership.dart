import 'package:flutter/material.dart';

class PatnerShip extends StatelessWidget {
  const PatnerShip({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              const SizedBox(height: 50),
              Text(
                "Partenaire",
                style: Theme.of(context).textTheme.titleLarge,
              )
            ])),
      )),
    );
  }
}
