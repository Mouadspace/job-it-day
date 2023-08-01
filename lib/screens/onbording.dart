import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';

class OnBording extends StatelessWidget {
  const OnBording({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                const SizedBox(height: 40),
                Image.asset(
                  'assets/images/ensak-logo.png',
                  cacheWidth: 155,
                  cacheHeight: 110,
                ),
                const SizedBox(height: 90),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.titleLarge,
                    children: [
                      const TextSpan(text: 'la troisième édition du\n'),
                      TextSpan(
                        text: 'ENSAK IT JOB DAYS\n',
                        style: TextStyle(
                            height: 3,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      const TextSpan(
                          text: 'Le\nVendredi 16 Decembre 2023\n',
                          style: TextStyle(
                            height: 2,
                          )),
                      TextSpan(
                        text: 'Sous le thème\n',
                        style: TextStyle(
                            height: 3,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      const TextSpan(
                          text: '%theme-name% ', style: TextStyle(height: 3))
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: CustomButton(
                    outline: true,
                    text: 'SE CONNECTER',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  child: CustomButton(
                    outline: false,
                    text: 'S\'INSCRIRE',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
