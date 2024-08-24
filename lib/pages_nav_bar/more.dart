import 'package:almokhtabarlab/custom_widgets/customappbar.dart';
import 'package:flutter/material.dart';

class More extends StatelessWidget {
  const More({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(title: 'More'),
            Center(
              child: Text('More'),
            ),
          ],
        ),
      ),
    );
  }
}