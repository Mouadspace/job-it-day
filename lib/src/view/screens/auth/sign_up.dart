import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/custom_input.dart';
import '../../widgets/custom_password_input.dart';
import '../../widgets/custom_stepper.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

int currentStep = 0;
final TextEditingController pswController = TextEditingController();
final TextEditingController psw2Controller = TextEditingController();
final formKeyStep1 = GlobalKey<FormState>();
final formKeyStep2 = GlobalKey<FormState>();
final formKeyStep3 = GlobalKey<FormState>();

String? isEmail(value) {
  if (!GetUtils.isEmail(value.toString())) {
    return "email address invalid";
  }
  return null;
}

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
                key: formKeyStep1,
                child: Column(
                  children: [
                    const CustomInput(
                      hintText: 'Email  de connexion',
                      validator: isEmail,
                    ),
                    const SizedBox(height: 30),
                    CustomPasswordInput(
                      hintText: "Mot de passe",
                      controller: [pswController],
                    ),
                    const SizedBox(height: 30),
                    CustomPasswordInput(
                      hintText: "Confirmer mot de passe",
                      controller: [psw2Controller, pswController],
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
              child: Form(
                key: formKeyStep2,
                child: Column(
                  children: const [
                    CustomInput(
                      hintText: 'ICE',
                    ),
                    SizedBox(height: 30),
                    CustomInput(
                      hintText: 'Nom de l\'entreprise',
                    ),
                    SizedBox(height: 30),
                    CustomInput(
                      hintText: 'Agence pub/ Marketing Direct',
                    ),
                    SizedBox(height: 30),
                    CustomInput(
                      hintText: 'Telephone de l\'entreprise',
                    ),
                    SizedBox(height: 30),
                    CustomInput(
                      hintText: 'Ville ',
                    ),
                    SizedBox(height: 30),
                    CustomInput(
                      hintText: 'Email de l\'entreprise',
                      validator: isEmail,
                    ),
                    SizedBox(height: 30),
                    CustomInput(
                      hintText: 'Lien linkdin de l\'entreprise',
                    ),
                  ],
                ),
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
              child: Form(
                key: formKeyStep3,
                child: Column(
                  children: [
                    const CustomInput(
                      hintText: 'Nom',
                    ),
                    const SizedBox(height: 30),
                    const CustomInput(
                      hintText: 'Prenom',
                    ),
                    const SizedBox(height: 30),
                    const CustomInput(
                      hintText: 'Sexe',
                    ),
                    const SizedBox(height: 30),
                    const CustomInput(
                      hintText: 'Telephone du manager',
                    ),
                    const SizedBox(height: 30),
                    const CustomInput(
                      hintText: 'Email de manager',
                      validator: isEmail,
                    ),
                    const SizedBox(height: 30),
                    const CustomInput(
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
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary)),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
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
                  }),
            onStepContinue: () {
              switch (currentStep) {
                case 0:
                  bool isStep1Valid = formKeyStep1.currentState!.validate();
                  if (isStep1Valid) {
                    setState(() {
                      currentStep += 1;
                    });
                  }
                  break;
                case 1:
                  bool isStep2Valid = formKeyStep2.currentState!.validate();
                  if (isStep2Valid) {
                    setState(() {
                      currentStep += 1;
                    });
                  }
                  break;
                case 2:
                  Get.toNamed('/test');
                  break;
              }
            },
            onStepTapped: (step) => {
                  setState(() {
                    currentStep = step;
                  })
                }),
      )),
    );
  }
}
