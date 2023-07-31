import 'package:flutter/material.dart';

class OnBording extends StatelessWidget {
  const OnBording({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              'hello flutter',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Image.asset('assets/images/ensak-logo.png')
          ],
        ),
      ),
    );
  }
}
