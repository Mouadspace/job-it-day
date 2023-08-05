import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobitday/view/widgets/custom_button.dart';
import '../../widgets/custom_password_input.dart';
import '../../widgets/custom_stepper.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

int currentStep = 0;

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
              content: const Center(
                child: Text('Information de connexion'),
              )),
          CustomStep(
              state: currentStep <= 1
                  ? CustomStepState.indexed
                  : CustomStepState.complete,
              isActive: currentStep >= 1,
              title: const SizedBox(),
              content: const Center(
                child: Text('Information de l\'entreprise'),
              )),
          CustomStep(
              state: currentStep <= 2
                  ? CustomStepState.indexed
                  : CustomStepState.complete,
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
      )),
    );
  }
}
