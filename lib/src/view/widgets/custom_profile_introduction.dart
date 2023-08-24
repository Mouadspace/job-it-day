import 'package:flutter/material.dart';

class CustomProfileIntroduction extends StatelessWidget {
  final String profileTitle;
  final String profileSubTitle;
  final String profileImage;
  final String? profileBeginningTitle;
  final String profileButtonText;
  // final void Function() profileButtonClicked;

  const CustomProfileIntroduction({
    super.key,
    required this.profileTitle,
    required this.profileSubTitle,
    required this.profileImage,
    this.profileBeginningTitle,
    required this.profileButtonText,
    // required this.profileButtonClicked,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          // Container for the blue background at the top
          Container(
            height: 276,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: Color(0xFF1864AB),
            ),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    profileBeginningTitle ?? '',
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MaterialButton(
                    elevation: 0.0,
                    // I have some shades in this button and i don't want them.
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 25),
                    onPressed: () {
                      debugPrint('button pressed');
                    },
                    textColor: Colors.white,
                    color: const Color(0xFF74a2cd),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Text(
                      profileButtonText,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Container for the image, title, and subtitle
          Transform.translate(
            offset: const Offset(0, -65),
            child: Column(
              children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 3,
                      color: const Color(0xFFE3F1FA),
                    ),
                    borderRadius: BorderRadius.circular(70),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(70),
                    child: Image.asset(
                      profileImage,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  profileTitle,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF212529),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  profileSubTitle,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
