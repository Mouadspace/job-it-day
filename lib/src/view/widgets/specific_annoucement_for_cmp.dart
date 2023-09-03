import 'package:flutter/material.dart';

import '../../model/companys_model.dart';

class SpecificAnnoucement extends StatelessWidget {
  final CompanyPost item;
  const SpecificAnnoucement({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    if (item.title.toLowerCase() == 'offre') {
      return Padding(
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
                    item.offerPosition ?? '',
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
                item.description,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF495057),
                  height: 2,
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListTile(
          title: const Text(
            "Description de la stande",
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
                    'De ${item.startDate.day} ${item.startDate.month} à ${item.endDate.day} ${item.endDate.month}',
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
                item.description,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF495057),
                  height: 2,
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      );
    }
  }
}
