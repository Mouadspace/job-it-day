import 'package:flutter/material.dart';

import '../../widgets/setting_acount_card.dart';

class Settings extends StatelessWidget {
  Settings({super.key});

  final List<AcountSetting> acountItems = [
    AcountSetting(iconName: 'modifier-profile.svg', label: 'Modifier profile'),
    AcountSetting(iconName: 'lock.svg', label: 'Mot de passe'),
    AcountSetting(iconName: 'email.svg', label: 'Adress email'),
    AcountSetting(iconName: 'telephone.svg', label: 'Telephone'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Text(
                  'Settings',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Text(
                'Account',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: acountItems.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: SettingAcountCard(
                      item: acountItems[index],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AcountSetting {
  String iconName, label;
  AcountSetting({required this.iconName, required this.label});
}
