import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

// import '../widgets/auth_as_container.dart';

class EnsakChiffre extends StatelessWidget {
  EnsakChiffre({super.key});

  // All the svg icons needed
  final SvgPicture etudiant = SvgPicture.asset(
    'assets/svgs/graduation-cap-solid.svg',
    color: Colors.white,
    width: 35,
    height: 35,
  );
  final SvgPicture professeur = SvgPicture.asset(
    'assets/svgs/briefcase-solid.svg',
    color: Colors.white,
    width: 35,
    height: 35,
  );
  final SvgPicture administration = SvgPicture.asset(
    'assets/svgs/building-columns-solid.svg',
    color: Colors.white,
    width: 35,
    height: 35,
  );
  final SvgPicture formation = SvgPicture.asset(
    'assets/svgs/book-solid.svg',
    color: Colors.white,
    width: 35,
    height: 35,
  );
  // --------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ENSAK en chiffres',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildCircleColumn(1697, 'Etudiants', etudiant),
                    // SizedBox(
                    //   width: 25,
                    // ),
                    _buildCircleColumn(60, 'Professeurs', professeur),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildCircleColumn(28, 'Administatifs', administration),
                    // SizedBox(
                    //   width: 25,
                    // ),
                    _buildCircleColumn(10, 'Formations', formation),
                  ],
                ),
                SizedBox(height: 29),
                Text(
                  'Présentation',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCircleColumn(int chiffre, String title, SvgPicture icon) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          child: icon,
        ),
        SizedBox(height: 8),
        Text(
          chiffre.toString(),
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(title),
      ],
    );
  }
}
