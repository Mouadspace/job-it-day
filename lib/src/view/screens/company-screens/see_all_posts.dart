import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobitday/src/view/widgets/show_offer.dart';
import 'package:jobitday/src/view/widgets/show_stand.dart';

import '../../../../core/app_asset.dart';
import '../../../../core/app_color.dart';
import '../../../model/companys_model.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_input.dart';
import '../../widgets/custom_message_input.dart';

class SeeAllPosts extends StatefulWidget {
  const SeeAllPosts({Key? key}) : super(key: key);

  @override
  State<SeeAllPosts> createState() => _SeeAllPostsState();
}

class _SeeAllPostsState extends State<SeeAllPosts>
    with TickerProviderStateMixin {
  TabController? tabController;
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
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    tabController!.addListener(_handleTabIndex);
  }

  @override
  void dispose() {
    tabController!.removeListener(_handleTabIndex);
    tabController!.dispose();
    super.dispose();
  }

  void _handleTabIndex() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('${tabController!.index}');
    return Scaffold(
      floatingActionButton: tabController!.index == 0
          ? _buildFloatActionButton(context, "offre", null)
          : _buildFloatActionButton(context, "stande", null),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Text(
              'Offers & Stands',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 20.0),
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
                    AppAsset.search,
                  ),
                ),
                prefixIconColor: Colors.black,
              ),
            ),
            const SizedBox(height: 20.0),
            Align(
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
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: displayList.length,
                          itemBuilder: (context, index) =>
                              ShowOffer(item: displayList[index]),
                        ),
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
          ],
        ),
      ),
    );
  }
}

Widget _buildFloatActionButton(context, title, onPressed) {
  return FloatingActionButton(
    backgroundColor: LightThemeColor.primaryColor,
    onPressed: () {
      // Show the adding Offer Form
      showModalBottomSheet(
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          )),
          context: context,
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 25.0,
              ),
              child: SizedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 20.0),
                    Text(
                      'Créer une $title',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 70.0),
                    CustomInput(
                      hintText: "Titre de $title",
                    ),
                    const SizedBox(height: 20),
                    const CustomInput(
                      // Let's say that here he needs to give the date,
                      // is it possible to have an input:date as we have in html.
                      hintText: 'Date limite ',
                    ),
                    const SizedBox(height: 20),
                    const CustomMessageInput(
                      hintText: 'Description',
                    ),
                    const SizedBox(height: 50),
                    CustomButton(
                        outline: false,
                        text: 'CREER ${title.toUpperCase()}',
                        onTabHandler: () => onPressed)
                  ],
                ),
              ),
            );
          });
    },
    child: const Icon(
      Icons.add,
      size: 40,
    ),
  );
}
