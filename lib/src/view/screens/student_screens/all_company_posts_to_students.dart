import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobitday/src/view/widgets/show_offer.dart';
import 'package:jobitday/src/view/widgets/show_stand.dart';

import '../../../model/companys_model.dart';

class ShowAllCompanyPostsToStudent extends StatefulWidget {
  const ShowAllCompanyPostsToStudent({Key? key}) : super(key: key);

  @override
  State<ShowAllCompanyPostsToStudent> createState() =>
      _ShowAllCompanyPostsToStudentState();
}

class _ShowAllCompanyPostsToStudentState
    extends State<ShowAllCompanyPostsToStudent> with TickerProviderStateMixin {
  List<CompanyPost> displayList = List.from(postsList);

  void updateList(String value) {
    setState(() {
      displayList = postsList
          .where((element) => element.offerPosition!
              .toLowerCase()
              .contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Text(
                'Offers & Stands',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                onChanged: (value) => updateList(value),
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "chercher ...",
                  hintStyle: Theme.of(context).textTheme.labelLarge,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(
                        left: 30, top: 10, bottom: 10, right: 20),
                    child: SvgPicture.asset(
                      'assets/svgs/search.svg',
                    ),
                  ),
                  prefixIconColor: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              // using tabBar and tabBarView
              // Don't forget to use Expande
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    controller: tabController,
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
                padding: const EdgeInsets.only(top: 17),
                child: Container(
                  width: double.maxFinite,
                  height: 700,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: displayList.length,
                            itemBuilder: (context, index) =>
                                ShowOffer(item: displayList[index]),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: displayList.length,
                            itemBuilder: (context, index) =>
                                ShowStand(item: displayList[index]),
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
      ),
    );
  }
}
