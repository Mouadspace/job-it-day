import 'package:flutter/material.dart';

import '../../model/companys_model.dart';
import '../widgets/custom_comapny_profile_intro.dart';
import '../widgets/post_card.dart';

class CompanyProfile extends StatelessWidget {
  const CompanyProfile({super.key});

  // void Function() directToEmail() {}

  @override
  Widget build(BuildContext context) {
    final List<CompanyPost> displayList = List.from(postsList);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomProfileCompanyIntro(
              profileTitle: 'Compgemini',
              profileSubTitle: 'comgemini@gmail.com',
              profileImage: 'assets/images/companyLogo-Compgemini.png',
            ),
            // For posts (Annonces)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Nos Annonces',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: displayList.length,
              itemBuilder: (context, index) =>
                  AnnouncementCard(item: displayList[index]),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
