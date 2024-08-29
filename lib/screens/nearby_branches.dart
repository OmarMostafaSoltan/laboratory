import 'package:al_ansary/custom_widgets/customappbar.dart';
import 'package:al_ansary/store_data/branches_locations.dart';
import 'package:al_ansary/store_data/get_branches_location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class NearbyBranches extends StatelessWidget {
  NearbyBranches({super.key});

  final Future<List<BrancheData>> branchesDetails = readBranches();

  @override
  Widget build(BuildContext context) {
    // Retrieve the arguments passed to this route
    final Map<String, double>? args = ModalRoute.of(context)?.settings.arguments as Map<String, double>?;

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
                      child:
                          CircularProgressIndicator()); // Show loading indicator
                } else if (snapshot.hasError) {
                  return Center(
                      child: Text('Error: ${snapshot.error}')); // Handle errors
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                      child:
                          Text('No branches available')); // Handle empty data
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
                          return {'branch': branch, 'distance': distanceInKilometers};
                        })
                        .toList();

                         // Sort by distance (ascending)
                    branches.sort((a, b) => (a['distance'] as double).compareTo(b['distance'] as double));

                  return ListView.builder(
                    itemCount: branches.length,
                    itemBuilder: (context, index) {

                      final branch = branches[index]['branch'] as BrancheData;
                        final distance = branches[index]['distance'] as double;
                      return Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
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
                                        fontSize: 16,
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
                                        throw 'Could not launch $url';
                                      }
                                      // Handle directions button click
                                    },
                                    icon: Icon(Icons.directions),
                                    label: Text('Directions'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Colors.red, // Background color
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Icons.location_on,
                                      color: Colors.black54),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      branch.address,
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ),
                                ],
                              ),
                               SizedBox(height: 8),
                                 // Display distance in kilometers
                                Text('Distance: ${distance.toStringAsFixed(2)} km'),
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
    ));
  }
}
