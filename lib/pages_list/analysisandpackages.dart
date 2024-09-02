import 'package:al_ansary/custom_widgets/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnalysisAndPackages extends StatelessWidget {
  const AnalysisAndPackages({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
              CustomAppBar(title: 'Analysis and Packages'),
           
          ],
        ),
      ),
    );
  }
}
