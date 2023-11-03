import 'package:flutter/material.dart';
import 'package:jobitday/src/view/screens/onBoarding/patnership.dart';
import 'package:jobitday/src/view/screens/onBoarding/team.dart';

import 'ensak_en_chiffre.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 1);

  int _activePage = 0;
  final List<Widget> _pages = [
    const EnsakChiffre(),
    const PatnerShip(),
    const Team()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            physics: const BouncingScrollPhysics(),
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _activePage = page;
              });
            },
            itemCount: _pages.length,
            itemBuilder: (BuildContext context, int index) {
              return _pages[index % _pages.length];
            },
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _activePage < 2
                  ? RawMaterialButton(
                      onPressed: () {
                        _pageController.animateToPage(
                          _activePage + 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      elevation: 2.0,
                      fillColor: Theme.of(context).colorScheme.primary,
                      padding: const EdgeInsets.all(15.0),
                      shape: const CircleBorder(),
                      child: const Icon(
                        Icons.navigate_next_rounded,
                        size: 45,
                        color: Colors.white,
                      ),
                    )
                  : const SizedBox(
                      key: Key("lastpage"),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
