import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../model/companys_model.dart';
import '../../widgets/company_card.dart';

class Companies extends StatefulWidget {
  const Companies({Key? key}) : super(key: key);

  @override
  State<Companies> createState() => _CompaniesState();
}

class _CompaniesState extends State<Companies> {
  List<CompanyModel> displayList = List.from(companiesList);

  void updateList(String value) {
    setState(() {
      displayList = companiesList
          .where((element) =>
              element.companyName.toLowerCase().contains(value.toLowerCase()))
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
              'Entreprises',
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
                    CompanyCard(item: displayList[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
