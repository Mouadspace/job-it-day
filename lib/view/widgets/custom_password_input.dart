import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomPasswordInput extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  const CustomPasswordInput({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  State<CustomPasswordInput> createState() => _CustomPasswordInputState();
}

class _CustomPasswordInputState extends State<CustomPasswordInput> {
  bool isVisible = true;
  String iconImg = 'assets/svgs/eye-slash.svg';
  @override
  Widget build(BuildContext context) {
    const TextStyle hintStyle = TextStyle(
      color: Color.fromRGBO(0, 0, 0, 0.5),
      fontSize: 16,
    );

    return TextFormField(
      controller: widget.controller,
      validator: (value) {
        var val = widget.controller.text.length;
        debugPrint('password validator : $val');
        if (!GetUtils.isGreaterThan(val, 6)) {
          return "mot de passe doit être de 7 à 30 caractères";
        }
        return null;
      },
      keyboardType: TextInputType.visiblePassword,
      obscureText: isVisible,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: GestureDetector(
            onTap: () => {
              setState(() {
                if (isVisible) {
                  iconImg = 'assets/svgs/eye.svg';
                } else {
                  iconImg = 'assets/svgs/eye-slash.svg';
                }
                isVisible = !isVisible;
              })
            },
            child: SvgPicture.asset(
              iconImg,
            ),
          ),
        ),
        isDense: true,
        hintText: widget.hintText,
        hintStyle: hintStyle,
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
