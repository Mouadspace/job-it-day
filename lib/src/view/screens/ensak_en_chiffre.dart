import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../model/ensak_stats_model.dart';

class EnsakChiffre extends StatelessWidget {
  const EnsakChiffre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 110),
                Text(
                  'ENSAK en chiffres',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: double.maxFinite,
                  height: 400,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: statsList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: ((context, index) {
                      debugPrint(statsList[index].label);
                      return CircleColumn(
                        chiffre: statsList[index].stats,
                        title: statsList[index].label,
                        icon: statsList[index].icon,
                      );
                    }),
                  ),
                ),
                Text(
                  'Présentation',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CircleColumn extends StatelessWidget {
  const CircleColumn({
    super.key,
    required this.chiffre,
    required this.title,
    required this.icon,
  });

  final int chiffre;
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          radius: 45,
          child: SvgPicture.asset(icon),
        ),
        const SizedBox(height: 8),
        Text(
          chiffre.toString(),
          style: const TextStyle(
            color: Color(0xff1E1E1E),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            color: Color.fromRGBO(0, 0, 0, .5),
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
