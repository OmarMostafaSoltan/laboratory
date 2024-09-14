import 'package:al_ansary/layout/layout.dart';
import 'package:al_ansary/pages_nav_bar/homepage.dart';
import 'package:al_ansary/notificationpage.dart';
import 'package:al_ansary/pages_list/analysis_and_packadges/analysisandpackages.dart';
import 'package:al_ansary/pages_list/approved.dart';
import 'package:al_ansary/pages_list/bookinghomevisit.dart';
import 'package:al_ansary/pages_list/myvisits.dart';
import 'package:al_ansary/pages_list/points.dart';
import 'package:al_ansary/screens/nearby_branches.dart';
import 'package:al_ansary/shoppingcart.dart';
import 'package:flutter/material.dart';

final Map<String,WidgetBuilder> routes ={
        'layout' : (context) => const Layout(),
        'homepage': (context)=> const HomePage(),
        'nearbybranches': (context)=>  NearbyBranches(),
        'bookinghomevisit': (context)=> const Bookinghomevisit(),
        'myvisits': (context) => const Myvisits(),
        'analysisandpackages' : (context) =>  const AnalysisAndPackages(),
        'points': (context) => const Points(),
        'approved' : (context)=> const Approved(),
        'notifications' : (context)=> const NotificationPage(),
        'shoppingcard' : (context) => const ShoppingCart()

      };
final List <Map<String,dynamic>> servicesList = [

  {'title' : 'booking home visit'  ,  'route' : 'bookinghomevisit', 'icon' : Icons.home},
  {'title' : 'my visits'           ,  'route' : 'myvisits', 'icon' : Icons.directions_run},
  {'title' : 'analysis and packages', 'route' : 'analysisandpackages', 'icon' : Icons.biotech},
  {'title' : 'points'              ,  'route' : 'points', 'icon' : Icons.label},
  {'title' : 'approved'            ,  'route' : 'approved' , 'icon':Icons.approval_rounded}
];
