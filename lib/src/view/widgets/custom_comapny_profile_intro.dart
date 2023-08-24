import 'package:flutter/material.dart';

class CustomProfileCompanyIntro extends StatelessWidget {
  final String profileTitle;
  final String profileSubTitle;
  final String profileImage;
  // final void Function() profileButtonClicked;

  const CustomProfileCompanyIntro({
    super.key,
    required this.profileTitle,
    required this.profileSubTitle,
    required this.profileImage,
    // required this.profileButtonClicked,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          // Container for the blue background at the top
          Container(
            height: 200,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: Color(0xFFEBF3FA),
            ),
          ),
          // Container for the image, title, and subtitle
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Transform.translate(
                offset: const Offset(0, -65),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 3,
                          color: const Color(0xFFE3F1FA),
                        ),
                        borderRadius: BorderRadius.circular(70),
                      ),
                      child: ClipRRect(
                        // Use ClipRRect to clip the image to the rounded border
                        borderRadius: BorderRadius.circular(70),
                        child: Image.asset(
                          profileImage,
                          fit: BoxFit
                              .cover, // Maintain aspect ratio and cover the container
                          width: 130,
                          height: 130,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      profileTitle,
                      style: const TextStyle(
                        fontSize: 16,
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
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
