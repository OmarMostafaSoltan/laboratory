import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Approved extends StatelessWidget {
  const Approved({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Approved',
          style: TextStyle(
            fontSize: 20.sp, // Responsive font size
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
