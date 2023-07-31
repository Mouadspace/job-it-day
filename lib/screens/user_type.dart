import 'package:flutter/material.dart';

class UserType extends StatelessWidget {
  const UserType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Sélectionner le type d\'utilisateur',
              style: Theme.of(context).textTheme.titleLarge,
            )
          ],
        ),
      )),
    );
  }
}
