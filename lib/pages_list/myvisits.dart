import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Myvisits extends StatelessWidget {
  const Myvisits({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'My Visits',
          style: TextStyle(
            fontSize: 24.sp, // Responsive font size
            fontWeight: FontWeight.bold,
            color: Colors.black, // Optional: adjust color
          ),
        ),
      ),
    );
  }
}
