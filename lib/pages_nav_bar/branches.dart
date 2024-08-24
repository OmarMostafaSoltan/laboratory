
import 'package:almokhtabarlab/custom_widgets/customappbar.dart';
import 'package:almokhtabarlab/store_data/branches_locations.dart';
import 'package:almokhtabarlab/store_data/get_branches_location.dart';
import 'package:almokhtabarlab/store_data/store_branches_location.dart';
import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';


class Branches extends StatefulWidget {
   const Branches({super.key});

  @override
  State<Branches> createState() => _BranchesState();
}

class _BranchesState extends State<Branches> {

@override
  void initState() {
    super.initState();
    saveBranches(branchesDetails); // Call the function to store data
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomAppBar(title: 'Branches'),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(right : 200.0),
              child: Text('Show by'),
            ),

            ElevatedButton(
              onPressed: (){
                readBranches();
              }
            , child: const Text('enable to degine my location ')
            ),

            ElevatedButton(
              onPressed: (){
               Navigator.pushNamed(context, 'nearbybranches');
              }
            , child: const Text('show nearby branches ')
            ),
//             GestureDetector(
//   onTap: () async {
//     final Uri url = Uri.parse('https://www.google.com/maps/place/Tayaran+Polyclinics+Agouza+-+%D8%B9%D9%8A%D8%A7%D8%AF%D8%A7%D8%AA+%D8%A7%D9%84%D8%B7%D9%8A%D8%B1%D8%A7%D9%86+%D8%A8%D8%A7%D9%84%D8%B9%D8%AC%D9%88%D8%B2%D8%A9%E2%80%AD/@30.056859,31.210741,16z/data=!4m6!3m5!1s0x145841cd1584485f:0x8690084f6c8c67b5!8m2!3d30.0568592!4d31.2107414!16s%2Fg%2F11vm0bbhfr?coh=219816&entry=tt');
//     if (await canLaunchUrl(url)) {
//       await launchUrl(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   },
//   child: const Text(
//     'Visit our website',
//     style: TextStyle(
//       color: Colors.blue,
//       decoration: TextDecoration.underline,
//     ),
//   ),
// ),
            
            

          ],
        ),
      ),
    );
  }
}
