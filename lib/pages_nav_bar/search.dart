import 'package:al_ansary/custom_widgets/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppBar(title: 'Search'),
            SizedBox(height: 30.h), // Add some spacing using scaled height
            Center(
              child: Text(
                'Search',
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
