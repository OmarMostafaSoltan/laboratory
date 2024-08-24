import 'package:almokhtabarlab/custom_widgets/customappbar.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(title: 'About'),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.only(right :200.0),
              child: Text('about'),
            ),
          ],
        ),
      ),
    );
  }
}