import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobitday/view/widgets/custom_input.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_password_input.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/ensak-logo.png',
                  cacheWidth: 155,
                  cacheHeight: 110,
                ),
              ),
              const SizedBox(height: 70),
              Text(
                'Se connecter',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 40),
              Text(
                'Email',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 15),
              const CustomInput(hintText: "email@gmail.com"),
              const SizedBox(height: 40),
              Text(
                'Mot de passe',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 15),
              const CustomPasswordInput(hintText: "entrez votre mot de passe"),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  'mot de passe oublié ?',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
              const SizedBox(height: 50),
              CustomButton(
                outline: false,
                text: "SE CONNECTER",
                onTabHandler: () => Get.toNamed('/test'),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Text(
                    'Pas de compte?  ',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed('/signup'),
                    child: Text(
                      's\'inscrire',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
