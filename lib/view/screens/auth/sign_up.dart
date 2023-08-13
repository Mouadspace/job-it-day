import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobitday/view/widgets/custom_button.dart';
import '../../widgets/custom_input.dart';
import '../../widgets/custom_password_input.dart';
import '../../widgets/custom_stepper.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

int currentStep = 0;
final TextEditingController textController = TextEditingController();
final TextEditingController pswController = TextEditingController();
final TextEditingController psw2Controller = TextEditingController();
final formKey = GlobalKey<FormState>();

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    List<CustomStep> stepList() => [
          CustomStep(
            state: currentStep <= 0
                ? CustomStepState.indexed
                : CustomStepState.complete,
            isActive: currentStep >= 0,
            title: const SizedBox(),
            content: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomInput(
                      controller: textController,
                      hintText: 'Email  de connexion',
                    ),
                    const SizedBox(height: 30),
                    CustomPasswordInput(
                      hintText: "Mot de passe",
                      controller: pswController,
                    ),
                    const SizedBox(height: 30),
                    CustomPasswordInput(
                      hintText: "Confirmer mot de passe",
                      controller: psw2Controller,
                    )
                  ],
                ),
              ),
            ),
          ),
          CustomStep(
            state: currentStep <= 1
                ? CustomStepState.indexed
                : CustomStepState.complete,
            isActive: currentStep >= 1,
            title: const SizedBox(),
            content: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  CustomInput(
                    controller: textController,
                    hintText: 'ICE',
                  ),
                  const SizedBox(height: 30),
                  CustomInput(
                    controller: textController,
                    hintText: 'Nom de l\'entreprise',
                  ),
                  const SizedBox(height: 30),
                  CustomInput(
                    controller: textController,
                    hintText: 'Agence pub/ Marketing Direct',
                  ),
                  const SizedBox(height: 30),
                  CustomInput(
                    controller: textController,
                    hintText: 'Telephone de l\'entreprise',
                  ),
                  const SizedBox(height: 30),
                  CustomInput(
                    controller: textController,
                    hintText: 'Ville ',
                  ),
                  const SizedBox(height: 30),
                  CustomInput(
                    controller: textController,
                    hintText: 'Email de l\'entreprise',
                  ),
                  const SizedBox(height: 30),
                  CustomInput(
                    controller: textController,
                    hintText: 'Lien linkdin de l\'entreprise',
                  ),
                ],
              ),
            ),
          ),
          CustomStep(
            state: currentStep <= 2
                ? CustomStepState.indexed
                : CustomStepState.complete,
            isActive: currentStep >= 2,
            title: const SizedBox(),
            content: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  CustomInput(
                    controller: textController,
                    hintText: 'Nom',
                  ),
                  const SizedBox(height: 30),
                  CustomInput(
                    controller: textController,
                    hintText: 'Prenom',
                  ),
                  const SizedBox(height: 30),
                  CustomInput(
                    controller: textController,
                    hintText: 'Sexe',
                  ),
                  const SizedBox(height: 30),
                  CustomInput(
                    controller: textController,
                    hintText: 'Telephone du manager',
                  ),
                  const SizedBox(height: 30),
                  CustomInput(
                    controller: textController,
                    hintText: 'Email de manager',
                  ),
                  const SizedBox(height: 30),
                  CustomInput(
                    controller: textController,
                    hintText: 'lien linkdin du manager',
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      const Checkbox(value: false, onChanged: null),
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(text: 'J\'accepte '),
                            TextSpan(
                                text: 'les conditions d\'utilisations',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color:
                                        Theme.of(context).colorScheme.primary)),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ];
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: CustomStepper(
            onStepContinueBtnLabel: "SUIVANT",
            type: CustomStepperType.horizontal,
            physics: const ScrollPhysics(),
            currentStep: currentStep,
            steps: stepList(),
            onStepCancel: () => currentStep == 0
                ? null
                : setState(() {
                    currentStep -= 1;
                    print(currentStep);
                  }),
            onStepContinue: () {
              if (currentStep < stepList().length - 1) {
                if (formKey.currentState!.validate()) {
                  setState(() {
                    currentStep += 1;
                    print(currentStep);
                  });
                }
              }
            },
            onStepTapped: (step) => {
                  if (formKey.currentState!.validate())
                    {
                      setState(() {
                        currentStep = step;
                        print(currentStep);
                      })
                    },
                }),
      )),
    );
  }
}
