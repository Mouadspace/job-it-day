import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../utils/ui_utils.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_input.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30, bottom: 60),
                child: BackIcon(),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text(
                  'Settings',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    debugPrint('edit profoile photo');
                  },
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                            color: Color(0xffE3F1FA), shape: BoxShape.circle),
                        child: CircleAvatar(
                          radius: 65,
                          backgroundColor: Colors.white,
                          child: Image.asset('assets/images/oracle-test.png'),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor: const Color(0xffE3F1FA),
                          child: SvgPicture.asset('assets/svgs/pen.svg'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(height: 15),
                    CustomInput(
                      hintText: "manager@gmail.com",
                      validator: (value) {
                        if (!GetUtils.isEmail(value.toString())) {
                          return "email address invalid";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 40),
                    Text(
                      'Prenom',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(height: 15),
                    const CustomInput(
                      hintText: "manager name",
                      validator: null,
                    ),
                    const SizedBox(height: 40),
                    CustomButton(
                        outline: false,
                        text: "ENREGISTRER",
                        onTabHandler: () {
                          if (formKey.currentState!.validate()) {
                            Get.toNamed('/test');
                          }
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
