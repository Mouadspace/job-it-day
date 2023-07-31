import 'package:flutter/material.dart';

class OnBording extends StatelessWidget {
  const OnBording({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      minimumSize: const Size.fromHeight(52),
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 3,
                      ),
                    ),
                    onPressed: () => Navigator.pushNamed(context, '/user'),
                    child: Text(
                      'SE CONNECTER',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 16),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        minimumSize: const Size.fromHeight(52),
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/user'),
                      child: const Text(
                        "S'INSCRIRE",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
