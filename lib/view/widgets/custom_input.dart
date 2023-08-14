import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const CustomInput(
      {super.key, 
      required this.hintText, 
      required this.controller
      });

  @override
  Widget build(BuildContext context) {
    const TextStyle hintStyle = TextStyle(
      color: Color.fromRGBO(0, 0, 0, 0.5),
      fontSize: 16,
    );
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (!GetUtils.isEmail(controller.text)) {
          return "email address invalid";
        }
        return null;
      },
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        hintStyle: hintStyle,
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
