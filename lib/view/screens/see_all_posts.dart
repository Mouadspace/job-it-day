import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobitday/view/widgets/post_card.dart';

import '../../model/companys_model.dart';

class SeeAllPosts extends StatefulWidget {
  const SeeAllPosts({Key? key}) : super(key: key);

  @override
  State<SeeAllPosts> createState() => _SeeAllPostsState();
}

class _SeeAllPostsState extends State<SeeAllPosts> {
  List<CompanyPost> displayList = List.from(postsList);
  // Above it need to be a list just for the offers and another exclusive for Stands.

  void updateList(String value) {
    setState(() {
      displayList = postsList
          .where((element) =>
              element.offerPosition.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: displayList.length,
                itemBuilder: (context, index) =>
                    AnnouncementCard(item: displayList[index]),
                // For the offers and stands in this situation we need widgets.
                // The offer widget shows
              ),
            ),
          ],
        ),
      ),
    );
  }
}
