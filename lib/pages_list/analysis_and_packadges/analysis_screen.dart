import 'package:al_ansary/custom_widgets/customappbar.dart';
import 'package:al_ansary/store_data/locations_data/analysis_data/analysis_backadges_lists.dart';
import 'package:al_ansary/store_data/locations_data/analysis_data/get_and_store_analysis/get_data_analysis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({super.key});

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  final TextEditingController _searchController = TextEditingController();
  Future<List<Analysis>> allAnalyses = readAnalysis();
  List<Analysis> filteredAnalyses = [];

  @override
  void initState() {
    // TODO: implement initState
    print(filteredAnalyses);

    // Initialize Futures

    allAnalyses = readAnalysis();

    _initializeData();
    _searchController.addListener(() {
      _filterLists(_searchController.text);
    });

    super.initState();
  }

  Future<void> _initializeData() async {
    List<Analysis> analyses = await allAnalyses;

    setState(() {
      filteredAnalyses = analyses;
    });
  }

  void _filterLists(String query) async {
    List<Analysis> analyses = await allAnalyses;
    setState(() {
      filteredAnalyses = analyses.where((analysis) {
        return analysis.analysisName
            .toLowerCase()
            .contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          const CustomAppBar(title: 'Analysis'),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h), // Scaled padding
            child: TextField(
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

          Expanded(
            child: ListView.builder(
              itemCount: filteredAnalyses.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Card(
                    color: const Color(0xff34c4c4),
                    child: ListTile(
                      leading: Image.network(
                        'https://th.bing.com/th/id/OIG3.KLlphMOYnkz.JZ5xEL6H?w=1024&h=1024&rs=1&pid=ImgDetMain',
                        scale: 8,
                      ),
                      title: Text(filteredAnalyses[index].analysisName),
                      subtitle: Text(
                        filteredAnalyses[index].price.toString(),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
