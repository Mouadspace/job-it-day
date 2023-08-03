import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final hintText;
  const CustomInput({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    const TextStyle hintStyle = TextStyle(
      color: Color.fromRGBO(0, 0, 0, 0.5),
      fontSize: 16,
    );
    return TextField(
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
