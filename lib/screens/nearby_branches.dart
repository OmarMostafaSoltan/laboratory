import 'package:almokhtabarlab/custom_widgets/customappbar.dart';
import 'package:almokhtabarlab/store_data/branches_locations.dart';
import 'package:almokhtabarlab/store_data/get_branches_location.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NearbyBranches extends StatelessWidget {
  NearbyBranches({super.key});

  final Future<List<BrancheData>> branchesDetails = readBranches();

  @override
  Widget build(BuildContext context) {
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
                  final branches = snapshot.data!;
                  return ListView.builder(
                    itemCount: branches.length,
                    itemBuilder: (context, index) {
                      final branch = branches[index];
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
                                          Uri.parse(branches[index].url);
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
