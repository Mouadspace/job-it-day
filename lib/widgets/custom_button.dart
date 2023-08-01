import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final bool outline;
  final String text;
  const CustomButton({
    super.key,
    required this.outline,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor:
            outline ? Colors.white : Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        minimumSize: const Size.fromHeight(52),
        side: BorderSide(
          color: Theme.of(context).colorScheme.primary,
          width: 3,
        ),
      ),
      onPressed: () => Navigator.pushNamed(context, '/user'),
      child: Text(text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color:
                outline ? Theme.of(context).colorScheme.primary : Colors.white,
          )),
    );
  }
}
