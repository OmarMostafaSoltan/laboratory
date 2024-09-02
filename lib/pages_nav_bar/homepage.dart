import 'package:al_ansary/custom_widgets/customappbar.dart';
import 'package:al_ansary/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {




    return SafeArea(
      child: Scaffold(
        body: 
        
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomAppBar(title: 'Welcome Omar'),
            SizedBox(
              height: 30.h, // Scaled height for spacing
            ),
            Padding(
              padding: EdgeInsets.only(right: 200.w), // Scaled padding
              child: Text(
                'Our Services',
                style: TextStyle(
                  fontSize: 15.sp, // Scaled text size
                  color: Colors.blueGrey,
                ),
              ),
            ),
            SizedBox(
              height: 500.h, // Scaled height
              width: 400.w,  // Scaled width
              child: ListTileTheme(
                tileColor: Color(0xFF002F5D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r), // Scaled border radius
                ),
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 10.h, right: 20.w, left: 20.w), // Scaled padding
                  itemCount: servicesList.length,
                  itemBuilder: (context, index) {
                    final itemServices = servicesList[index];
                    return Padding(
                      padding: EdgeInsets.all(5.0.w), // Scaled padding
                      child: ListTile(
                        
                        leading: Icon(
                          itemServices['icon'],
                          size: 24.sp,
                          color: Colors.white, // Scaled icon size
                        ),
                        trailing: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 24.sp, // Scaled icon size
                        ),
                        title: Text(
                          itemServices['title'],
                          style: TextStyle(fontSize: 16.sp,color: Colors.white), // Scaled text size
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, itemServices['route']);
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}