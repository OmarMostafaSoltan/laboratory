import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final int selectedItemCount; // New optional parameter for item count

  const CustomAppBar({
    super.key,
    required this.title,
    this.selectedItemCount = 0, // Default value is 0
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 45.h, // Scaled height
      child: Padding(
        padding: EdgeInsets.only(left: 12.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start, // Align children
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'notifications');
              },
              child: Icon(
                size: 25.w,
                Icons.notifications_outlined,
              ),
            ),
            SizedBox(width: 6.w),
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'shoppingcard');
                  },
                  child: Icon(
                    size: 25.w,
                    Icons.sticky_note_2_outlined,
                  ),
                ),
                // Badge for selected item count
                if (selectedItemCount > 0) ...[
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        selectedItemCount.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ]
              ],
            ),
            SizedBox(width: 60.w), // Scaled spacing
            Text(
              title,
              style: TextStyle(
                fontSize: 18.sp, // Scaled text size
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
