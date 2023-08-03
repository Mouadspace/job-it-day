import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomPasswordInput extends StatefulWidget {
  final String hintText;
  const CustomPasswordInput({
    super.key,
    required this.hintText,
  });

  @override
  State<CustomPasswordInput> createState() => _CustomPasswordInputState();
}

class _CustomPasswordInputState extends State<CustomPasswordInput> {
  bool isVisible = false;
  String iconImg = 'assets/svgs/eye.svg';
  @override
  Widget build(BuildContext context) {
    const TextStyle hintStyle = TextStyle(
      color: Color.fromRGBO(0, 0, 0, 0.5),
      fontSize: 16,
    );

    return TextField(
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
