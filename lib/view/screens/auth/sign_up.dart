import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobitday/view/widgets/custom_button.dart';

import '../../widgets/custom_password_input.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle hintStyle = TextStyle(
      color: Color.fromRGBO(0, 0, 0, 0.5),
      fontSize: 16,
    );

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            // color: Colors.lightBlue,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const SizedBox(height: 50),
                Text(
                  'Information de connexion',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 30),
                TextField(
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: "Email de connexion",
                    hintStyle: hintStyle,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const CustomPasswordInput(hintText: "Mot de passe"),
                const SizedBox(height: 30),
                const CustomPasswordInput(hintText: "confirmer mot de passe"),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomButton(
                        outline: false,
                        text: "SUIVANT",
                        onTabHandler: () => {Get.toNamed('/test')}),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
