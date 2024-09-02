import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Points extends StatelessWidget {
  const Points({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Points',
          style: TextStyle(
            fontSize: 22.sp, // Responsive font size
            fontWeight: FontWeight.bold,
            color: Colors.black, // Optional: adjust color
          ),
        ),
      ),
    );
  }
}
