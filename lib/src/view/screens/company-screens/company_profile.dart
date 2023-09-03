import 'package:flutter/material.dart';

import '../../../model/companys_model.dart';
import '../../widgets/custom_comapny_profile_intro.dart';
import '../../widgets/post_card.dart';

class CompanyProfile extends StatefulWidget {
  const CompanyProfile({super.key});

  @override
  _CompanyProfileState createState() => _CompanyProfileState();
}

class _CompanyProfileState extends State<CompanyProfile>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // 2 tabs in total
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
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
            const SizedBox(
              height: 20.0,
            ),
            // using tabBar and tabBarView
            // Don't forget to use Expande
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  unselectedLabelColor: Colors.black.withOpacity(0.5),
                  labelColor: const Color(0xFF1864AB),
                  indicatorColor: const Color(0xFF1864AB),
                  tabs: const [
                    Tab(
                      text: 'OFFRES',
                    ),
                    Tab(
                      text: 'STANDS',
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: SizedBox(
                width: double.maxFinite,
                height: 700,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: displayList.length,
                          itemBuilder: (context, index) => AnnouncementCard(
                            item: displayList[index],
                            type: 1,
                          ), // 1 for the offres
                        ),
                      ],
                    ),
                    ListView(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: displayList.length,
                          itemBuilder: (context, index) => AnnouncementCard(
                            item: displayList[index],
                            type: 2,
                          ), // 2 for the stands
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
