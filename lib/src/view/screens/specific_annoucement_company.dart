import 'package:flutter/material.dart';

import '../../model/companys_model.dart';
import '../widgets/custom_comapny_profile_intro.dart';

class ShowSpecificCompanyPost extends StatelessWidget {
  const ShowSpecificCompanyPost({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CompanyPost> displayList = List.from(postsList);
    CompanyPost exmapleSpecificPost =
        displayList[0]; // Instead of 0, we can pass the input.

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                title: const Text(
                  "Description de l'offer",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF212529),
                  ),
                ),
                subtitle: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          exmapleSpecificPost.offerPosition,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF808080),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      exmapleSpecificPost.description,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF495057),
                        height: 4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
