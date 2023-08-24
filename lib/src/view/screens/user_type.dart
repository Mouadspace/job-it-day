import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/auth_as_container.dart';

class UserType extends StatelessWidget {
  const UserType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 140, left: 30, bottom: 60),
              child: Text(
                'Sélectionner \nle type d\'utilisateur',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            GestureDetector(
              onTap: () => Get.toNamed('/signup'),
              child: const AuthAsContainer(
                authType: 'Entreprise',
                img: 'assets/images/entreprise-img.png',
                color: Color(0xffF99746),
              ),
            ),
            const SizedBox(height: 40),
            const AuthAsContainer(
              authType: 'Etudiant',
              img: 'assets/images/etudiant-img.png',
              color: Color(0xff1864AB),
            ),
          ],
        ),
      )),
    );
  }
}
