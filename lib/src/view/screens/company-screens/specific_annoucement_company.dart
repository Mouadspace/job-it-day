import 'package:flutter/material.dart';

import '../../../model/companys_model.dart';
import '../../widgets/custom_comapny_profile_intro.dart';
import '../../widgets/specific_annoucement_for_cmp.dart';

class ShowSpecificCompanyPost extends StatelessWidget {
  const ShowSpecificCompanyPost({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CompanyPost> displayList = List.from(postsList);
    CompanyPost exmapleSpecificPost =
        displayList[7]; // Instead of 0, we can pass the input.

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomProfileCompanyIntro(
              profileTitle: 'Microsoft',
              profileSubTitle: 'microsoft@gmail.com',
              profileImage: 'assets/images/companyLogo-Microsoft.png',
            ),
            // For posts (Annonces)
            SpecificAnnoucement(item: exmapleSpecificPost),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
