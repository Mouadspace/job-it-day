import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/app_data.dart';
import '../widgets/custom_button.dart';

class OnBording extends StatelessWidget {
  OnBording({super.key});

  final Uri _url = Uri.parse(AppData.url);
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime eventDate = DateTime(2023, 11, 22);
    DateTime timeLeft = DateTime(
      0,
      0,
      eventDate.day - now.day - 1,
      23 - now.hour,
      59 - now.minute,
      60 - now.second,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                const SizedBox(height: 40),
                Image.asset(
                  'assets/images/ensak-logo.png',
                  cacheWidth: 155,
                  cacheHeight: 110,
                ),
                const SizedBox(height: 90),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.titleLarge,
                    children: [
                      const TextSpan(text: 'la troisième édition du\n'),
                      TextSpan(
                        text: 'ENSAK IT JOB DAYS\n',
                        style: TextStyle(
                            height: 3,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      const TextSpan(
                          text: 'Le\nMercredi 22 Novembre 2023\n',
                          style: TextStyle(
                            height: 2,
                          )),
                      TextSpan(
                        text: 'Sous le thème\n',
                        style: TextStyle(
                            height: 3,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      const TextSpan(
                          text: '%theme-name% ', style: TextStyle(height: 3))
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                TimerCountdown(
                  timeTextStyle:
                      Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                  colonsTextStyle: const TextStyle(
                    color: Colors.transparent,
                  ),
                  format: CountDownTimerFormat.daysHoursMinutesSeconds,
                  endTime: DateTime.now().add(
                    Duration(
                      days: timeLeft.day,
                      hours: timeLeft.hour,
                      minutes: timeLeft.minute,
                      seconds: timeLeft.second,
                    ),
                  ),
                  daysDescription: "Jours",
                  hoursDescription: "Heures",
                  minutesDescription: "Minutes",
                  secondsDescription: "Secondes",
                  onEnd: () {
                    debugPrint("Timer finished");
                  },
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: CustomButton(
                    outline: true,
                    text: 'DECOUVRIR L\'EVENEMENT',
                    onTabHandler: () => Get.toNamed('/base_screen'),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  child: CustomButton(
                    outline: false,
                    text: 'VISITER LE SITE WEB',
                    // onTabHandler: () => Get.toNamed('/user'),
                    onTabHandler: _launchUrl,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
