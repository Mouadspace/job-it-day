import 'package:flutter/material.dart';

import '../../../model/companys_model.dart';
import '../../../model/students_model.dart';
import '../../widgets/specific_annoucement_for_cmp.dart';
import '../../widgets/student_card.dart';

class SeeAllApplicants extends StatelessWidget {
  // This is specific item that we will be desplaying
  // It will ba given as an argument from the clicked container.
  const SeeAllApplicants({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<StudentModel> studentsDisplayList = List.from(studentsList);
    final List<CompanyPost> companiesDisplayList = List.from(postsList);
    CompanyPost item = companiesDisplayList[0];
    // Here is where the company can see all the applicants of a certain offre
    // This is a destination after clicking on an offre in the company personal profile
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          SpecificAnnoucement(item: item),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              'Condidats',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          const SizedBox(height: 10.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: studentsDisplayList.length,
                itemBuilder: (context, index) =>
                    StudentCard(item: studentsDisplayList[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
