import 'package:al_ansary/custom_widgets/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppBar(title: 'About'),
            SizedBox(height: 20.h), // Scale the height
            Padding(
              padding: EdgeInsets.only(right: 200.w), // Scale the right padding
              child: Text(
                'About',
                style: TextStyle(
                  fontSize: 18.sp, // Scale the text size 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
