import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobitday/view/widgets/custom_button.dart';

import '../../widgets/custom_password_input.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

int currentStep = 0;

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    List<Step> stepList() => [
          Step(
              state: currentStep <= 0 ? StepState.indexed : StepState.complete,
              isActive: currentStep >= 0,
              title: const SizedBox(),
              content: const Center(
                child: Text('Information de connexion'),
              )),
          Step(
              state: currentStep <= 1 ? StepState.indexed : StepState.complete,
              isActive: currentStep >= 1,
              title: const SizedBox(),
              content: const Center(
                child: Text('Information de l\'entreprise'),
              )),
          Step(
              state: currentStep <= 2 ? StepState.indexed : StepState.complete,
              isActive: currentStep >= 2,
              title: const SizedBox(),
              content: const Center(
                child: Text('Information du manager'),
              ))
        ];
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ConstrainedBox(
            constraints: const BoxConstraints.tightFor(height: 500.0),
            child: Stepper(
              type: StepperType.horizontal,
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
                  setState(() {
                    currentStep += 1;
                    print(currentStep);
                  });
                }
              },
              onStepTapped: (step) => setState(() {
                currentStep = step;
                print(currentStep);
              }),
            ),
          ),
        ),
      )),
    );
  }
}
