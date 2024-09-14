import 'package:al_ansary/custom_widgets/customappbar.dart';
import 'package:al_ansary/store_data/locations_data/branches_locations.dart';
import 'package:al_ansary/store_data/locations_data/get_branches_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class NearbyBranches extends StatelessWidget {
  NearbyBranches({super.key});

  final Future<List<BrancheData>> branchesDetails = readBranches();

  @override
  Widget build(BuildContext context) {
    // Retrieve the arguments passed to this route
    final Map<String, double>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, double>?;

    double? latitude = args?['latitude'];
    double? longitude = args?['longitude'];

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomAppBar(title: 'Nearby branches'),
            Expanded(
              child: FutureBuilder<List<BrancheData>>(
                future: branchesDetails, // Pass the future to FutureBuilder
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2.w, // Optional: Scale stroke width
                      ),
                    ); // Show loading indicator
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Error: ${snapshot.error}',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ); // Handle errors
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
                      child: Text(
                        'No branches available',
                        style: TextStyle(fontSize: 16.sp),
                      ),
                    ); // Handle empty data
                  } else {
                    final branches = snapshot.data!
                        .map((branch) {
                          double distance = Geolocator.distanceBetween(
                            latitude!,
                            longitude!,
                            branch.latitude,
                            branch.longitude,
                          );
                          double distanceInKilometers = distance / 1000;
                          return {
                            'branch': branch,
                            'distance': distanceInKilometers
                          };
                        })
                        .toList();

                    // Sort by distance (ascending)
                    branches.sort((a, b) => (a['distance'] as double)
                        .compareTo(b['distance'] as double));

                    return ListView.builder(
                      padding: EdgeInsets.only(
                        top: 10.h,
                        right: 20.w,
                        left: 20.w,
                        bottom: 10.h, // Optional: Add bottom padding
                      ),
                      itemCount: branches.length,
                      itemBuilder: (context, index) {
                        final branch =
                            branches[index]['branch'] as BrancheData;
                        final distance =
                            branches[index]['distance'] as double;
                        return Card(
                          color: const Color(0xff34c4c4),
                          margin: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 5.h,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          elevation: 3, // Optional: Add elevation
                          child: Padding(
                            padding: EdgeInsets.all(10.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        branch.name,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp,
                                          color: const Color(0xFF002F5D)
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    ElevatedButton.icon(
                                      onPressed: () async {
                                        final Uri url =
                                            Uri.parse(branch.url);
                                        if (await canLaunchUrl(url)) {
                                          await launchUrl(url);
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  'Could not launch ${branch.url}'),
                                            ),
                                          );
                                        }
                                      },
                                      icon: Icon(
                                        Icons.directions,
                                        size: 20.w,
                                        color: const Color(0xff34c4c4),
                                      ),
                                      label: Text(
                                        'Directions',
                                        style: TextStyle(fontSize: 14.sp,
                                        color: Colors.white 
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFF002F5D),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 12.w,
                                          vertical: 8.h,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.h),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.black54,
                                      size: 20.w,
                                    ),
                                    SizedBox(width: 8.w),
                                    Expanded(
                                      child: Text(
                                        branch.address,
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.h),
                                // Display distance in kilometers
                                Text(
                                  'Distance: ${distance.toStringAsFixed(2)} km',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: const Color(0xFF002F5D),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
