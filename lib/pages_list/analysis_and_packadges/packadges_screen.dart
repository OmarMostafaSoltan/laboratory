import 'package:al_ansary/custom_widgets/customappbar.dart';
import 'package:al_ansary/store_data/locations_data/analysis_data/analysis_backadges_lists.dart';
import 'package:al_ansary/store_data/locations_data/analysis_data/get_and_store_packages/get_data_packages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PackadgesScreen extends StatefulWidget {
  const PackadgesScreen({super.key});

  @override
  State<PackadgesScreen> createState() => _PackadgesScreenState();
}

class _PackadgesScreenState extends State<PackadgesScreen> {
  final TextEditingController _searchController = TextEditingController();
  Future<List<Package>> allPackages = readPackage();
  List<Package> filteredPackages = [];
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    print(filteredPackages);
    // Initialize Futures
    allPackages = readPackage();

    _initializeData();
    _searchController.addListener(() {
      _filterLists(_searchController.text);
    });

    super.initState();
  }

  Future<void> _initializeData() async {
    List<Package> packages = await allPackages;

    setState(() {
      filteredPackages = packages;
    });
  }

  void _filterLists(String query) async {
    List<Package> packages = await allPackages;

    setState(() {
      filteredPackages = packages.where((package) {
        return package.packageName.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  void dispose() {
    // Unfocus the TextField to hide the keyboard when leaving the screen
    _focusNode.unfocus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            const CustomAppBar(
              title: 'Packedges',
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w), // Scaled padding
              child: TextField(
                focusNode: _focusNode,
                controller: _searchController,
                style: TextStyle(fontSize: 16.sp, color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                      fontSize: 14.sp, color: Colors.grey), // Scaled text size
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.h), // Scaled padding
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(8.r), // Scaled border radius
                    borderSide: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1.w), // Scaled border side
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1.w), // Match the border color and width
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1.w), // Match the border color and width
                  ),
                  prefixIcon: Icon(Icons.search,
                      size: 24.sp, color: Colors.grey), // Scaled icon size
                ),
                onChanged: (value) {
                  _filterLists(value);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: SizedBox(
                height: 400,
                child: Column(
                  children: [
                    SizedBox(
                      height: 300.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: filteredPackages.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8.0), // Adjust margin
                            width:230.w, // Adjust width to make the card narrower
                            child: Card(
                              color: const Color(0xff34c4c4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0.r), // Add corner radius
                              ),
                              elevation: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    'https://th.bing.com/th/id/OIG4.KjSaiUz0Lxkz3KaYzQn.?w=270&h=270&c=6&r=0&o=5&pid=ImgGn',
                                    height: 200.h, // Adjust image height
                                    width: double
                                        .infinity, // Make image take full width of the card
                                    fit: BoxFit
                                        .cover, // Ensure the image fits within the card
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    child: Text(
                                      filteredPackages[index].packageName,
                                      style: TextStyle(
                                          fontSize: 12.0.w,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(height: 4.0.h),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    child: Text(
                                      filteredPackages[index].price.toString(),
                                      style: TextStyle(
                                          fontSize: 10.0.w,
                                          color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
