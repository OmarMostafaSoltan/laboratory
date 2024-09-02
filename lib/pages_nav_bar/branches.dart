import 'package:al_ansary/custom_widgets/customappbar.dart';
import 'package:al_ansary/store_data/get_branches_location.dart';
import 'package:al_ansary/store_data/user_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';

class Branches extends StatelessWidget {
  const Branches({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomAppBar(title: 'Branches'),
            SizedBox(
              height: 20.h, // Scale the height
            ),
            Padding(
              padding: EdgeInsets.only(right: 200.w), // Scale the right padding
              child: Text(
                'Show by',
                style: TextStyle(fontSize: 16.sp), // Scale the text size (if needed)
              ),
            ),
            SizedBox(height: 20.h), // Add space between elements, scaled by screen height
            // ElevatedButton(
            //   onPressed: () {
            //     readBranches();
            //   },
            //   style: ElevatedButton.styleFrom(
            //     padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w), // Scale the button padding
            //   ),
            //   child: Text(
            //     'Enable to define my location',
            //     style: TextStyle(fontSize: 16.sp), // Scale the button text size
            //   ),
            // ),
            SizedBox(height: 10.h), // Add space between elements
            ElevatedButton(
              onPressed: () async {
                Position position = await UserLocation().getCurrentLocation();
                print("================================= Longitude: ${position.longitude}\nLatitude: ${position.latitude}");
                Navigator.pushNamed(context, 'nearbybranches', arguments: {
                  'latitude': position.latitude,
                  'longitude': position.longitude,
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:const Color(0xFF002F5D),
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w), // Scale the button padding
              ),
              child: Text(
                'Show nearby branches',
                style: TextStyle(fontSize: 16.sp,color: Colors.white), // Scale the button text size
              ),
            ),
          ],
        ),
      ),
    );
  }
}
