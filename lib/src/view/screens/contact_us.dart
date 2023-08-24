import 'package:flutter/material.dart';

import '../../view/screens/auth/sign_up.dart';
import '../widgets/custom_message_input.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_input.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 110),
                Text(
                  'Contactez-nous',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 50),
                const CustomInput(
                  hintText: 'Nom',
                ),
                const SizedBox(height: 30),
                const CustomInput(
                  hintText: 'Prènom',
                ),
                const SizedBox(height: 30),
                const CustomInput(
                  hintText: "Email",
                  validator: isEmail,
                ),
                const SizedBox(height: 30),
                const CustomInput(
                  hintText: 'Téléphone',
                ),
                const SizedBox(height: 30),
                const CustomMessageInput(
                  hintText: 'Message',
                ),
                const SizedBox(height: 50),
                CustomButton(
                    outline: false,
                    text: "ENVOYER",
                    onTabHandler: () {
                      // Send the message to the table of the managers, or at least to the email of the managers.
                    }),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
