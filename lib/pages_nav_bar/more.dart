import 'package:al_ansary/custom_widgets/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class More extends StatelessWidget {
  const More({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppBar(title: 'More'),
            SizedBox(height: 30.h), // Add some spacing using scaled height
            Center(
              child: Text(
                'More',
                style: TextStyle(
                  fontSize: 20.sp, // Scaled text size
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
