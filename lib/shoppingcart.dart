import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text('Shopping Cart',
        style: TextStyle(fontSize: 24.sp), 
        )// Scaling the text size),
      ),
    );
  }
}