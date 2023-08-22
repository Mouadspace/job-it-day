import 'package:flutter/material.dart';

import '../../model/companys_model.dart';
import '../widgets/custom_profile_introduction.dart';
import '../widgets/post_card.dart';

class CompanyProfile extends StatelessWidget {
  const CompanyProfile({super.key});

  // void Function() directToEmail() {}

  @override
  Widget build(BuildContext context) {
    final List<CompanyPost> displayList = List.from(postsList);
    print(displayList);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomProfileIntroduction(
              profileTitle: 'Compgemini',
              profileSubTitle: 'comgemini@gmail.com',
              profileImage: 'assets/images/companyLogo-Compgemini.png',
              profileButtonText: 'Contactez-nous',
              // profileButtonClicked: directToEmail(),
            ),
            // For posts (Annonces)
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Nos Annonces',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: displayList.length,
              itemBuilder: (context, index) =>
                  AnnouncementCard(item: displayList[index]),
            ),
          ],
        ),
      ),
    );
  }
}
