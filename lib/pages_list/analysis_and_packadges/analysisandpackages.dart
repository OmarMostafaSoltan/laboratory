import 'package:al_ansary/custom_widgets/customappbar.dart';
import 'package:al_ansary/pages_list/analysis_and_packadges/analysis_screen.dart';
import 'package:al_ansary/pages_list/analysis_and_packadges/cubit/selectanalyses_cubit.dart';
import 'package:al_ansary/pages_list/analysis_and_packadges/packadges_screen.dart';
import 'package:al_ansary/store_data/locations_data/analysis_data/analysis_backadges_lists.dart';
import 'package:al_ansary/store_data/locations_data/analysis_data/get_and_store_analysis/get_data_analysis.dart';
import 'package:al_ansary/store_data/locations_data/analysis_data/get_and_store_packages/get_data_packages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnalysisAndPackages extends StatefulWidget {
  const AnalysisAndPackages({super.key});

  @override
  State<AnalysisAndPackages> createState() => _AnalysisAndPackagesState();
}

class _AnalysisAndPackagesState extends State<AnalysisAndPackages> {
  final TextEditingController _searchController = TextEditingController();
  late Future<List<Package>> allPackages;
  late Future<List<Analysis>> allAnalyses;

  @override
  void initState() {
    super.initState();
    allPackages = readPackage();
    allAnalyses = readAnalysis();

    // Listen for changes in the search field
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            BlocBuilder<SelectanalysesCubit, List<dynamic>>(
              builder: (context, selectedItems) {
                return CustomAppBar(
                  title: 'Analysis and Packages',
                  selectedItemCount:
                      selectedItems.length, // Pass the selected items count
                );
              },
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: TextField(
                controller: _searchController,
                style: TextStyle(fontSize: 16.sp, color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide:
                        BorderSide(color: Colors.grey.shade300, width: 1.w),
                  ),
                  prefixIcon:
                      Icon(Icons.search, size: 24.sp, color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Packages'),
                  GestureDetector(
                    child: const Text(
                      'See All',
                      style: TextStyle(
                          color: Color(0xFF002F5D),
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PackadgesScreen()));
                    },
                  ),
                ],
              ),
            ),
            // FutureBuilder for Packages
            FutureBuilder<List<Package>>(
              future: allPackages,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  // Apply search filter here
                  final filteredPackages = snapshot.data!.where((package) {
                    return package.packageName
                        .toLowerCase()
                        .contains(_searchController.text.toLowerCase());
                  }).toList();

                  if (filteredPackages.isEmpty) {
                    return const Center(child: Text('No packages found.'));
                  }

                  return SizedBox(
                    height: 120.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: filteredPackages.length,
                      itemBuilder: (context, index) {

                        final package = filteredPackages[index];

                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          width: 230.w,
                          child: _buildCard(
                            filteredPackages[index].packageName,
                            filteredPackages[index].price.toString(), 
                            package
                            ),
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(child: Text('No packages available.'));
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Analysis'),
                  GestureDetector(
                    child: const Text(
                      'See All',
                      style: TextStyle(
                          color: Color(0xFF002F5D),
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AnalysisScreen()));
                    },
                  ),
                ],
              ),
            ),
            // FutureBuilder for Analyses
            Expanded(
              child: FutureBuilder<List<Analysis>>(
                future: allAnalyses,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    // Apply search filter here

                    final filteredAnalyses = snapshot.data!.where((analysis) {
                      return analysis.analysisName
                          .toLowerCase()
                          .contains(_searchController.text.toLowerCase());
                    }).toList();

                    if (filteredAnalyses.isEmpty) {
                      return const Center(child: Text('No analyses found.'));
                    }

                    return ListView.builder(
                      itemCount: filteredAnalyses.length,
                      itemBuilder: (context, index) {

                        final analysis = filteredAnalyses[index];

                        return _buildCard(filteredAnalyses[index].analysisName,
                            filteredAnalyses[index].price.toString(), analysis);
                      },
                    );
                  } else {
                    return const Center(child: Text('No analyses available.'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String name, String price, dynamic item) {
    return Card(
      color: const Color(0xff34c4c4),
      child: BlocBuilder<SelectanalysesCubit, List<dynamic>>(
        builder: (context, selectedItems) {
          final isSelected = selectedItems.contains(item);

          return ListTile(
            title: Text(name),
            subtitle: Text(price),
            trailing: IconButton(
              icon: Icon(
                isSelected
                    ? Icons.check_circle_outline
                    : Icons.add_circle_outline,
                color: isSelected ? Colors.green : Colors.grey,
              ),
              onPressed: () {
                final cubit = context.read<SelectanalysesCubit>();
                if (isSelected) {
                  cubit.removeItem(item);
                } else {
                  cubit.addItem(item);
                }
              },
            ),
          );
        },
      ),
    );
  }
}
