import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 45.h, // Scaled height
      child: Padding(
        padding:  EdgeInsets.only(left :12.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start, // Space between children
          children: [
            GestureDetector(
              onTap: (){Navigator.pushNamed(context, 'notifications');} ,
              child: Icon(
                size: 25.w,
                Icons.notifications_active_outlined,
              ),
            ),
            SizedBox(width: 6.w,),
            GestureDetector(
              onTap: (){Navigator.pushNamed(context, 'shoppingcard');} ,
              child:  Icon(
                size: 25.w,
                Icons.shopping_cart_checkout_outlined,
              ),
            ),
           
            SizedBox(
              width: 60.w, // Scaled spacing
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 18.sp, // Scaled text size
                color: Color(0xFF002F5D)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
