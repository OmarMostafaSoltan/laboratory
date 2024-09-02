import 'package:al_ansary/layout/cubit/navigation_cubit.dart';
import 'package:al_ansary/pages_nav_bar/about.dart';
import 'package:al_ansary/pages_nav_bar/branches.dart';
import 'package:al_ansary/pages_nav_bar/homepage.dart';
import 'package:al_ansary/pages_nav_bar/more.dart';
import 'package:al_ansary/pages_nav_bar/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<NavigationCubit>(
        create: (context) => NavigationCubit(),
        child: Scaffold(
          body: BlocBuilder<NavigationCubit, NavigationState>(
            builder: (context, state) {
              switch (state.selectedIndex) {
                case 0:
                  return const HomePage();
          
                case 1:
                  return const Search();
          
                case 2:
                  return const About();
          
                case 3:
                  return const Branches();
          
                case 4:
                  return const More();
          
                default:
                  return const SizedBox();
              }
            },
          ),
          bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
            builder: (context, state) {
              return NavigationBar(
                indicatorColor:Colors.white,
                backgroundColor:Colors.white,
                
                destinations: [
                  NavigationDestination(
                    icon: Icon(Icons.home_outlined, size: 24.sp),
                    label: 'Home',
                    selectedIcon: Icon(Icons.home_outlined, size: 20.sp,color: Color(0xFF002F5D),),
                    
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.search_outlined, size: 24.sp),
                    label: 'Search',
                    
                    selectedIcon: Icon(Icons.search_outlined, size: 20.sp,color: Color(0xFF002F5D),),
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.info_outline, size: 24.sp),
                    label: 'About',
                    selectedIcon: Icon(Icons.info_outline, size: 20.sp,color:Color(0xFF002F5D)),
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.location_city, size: 24.sp),
                    label: 'Branches',
                    selectedIcon: Icon(Icons.location_on_outlined, size: 20.sp,color: Color(0xFF002F5D)),
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.menu_outlined, size: 24.sp),
                    label: 'More',
                    selectedIcon: Icon(Icons.menu_outlined, size: 20.sp,color: Color(0xFF002F5D),),
                  ),
                ],
                selectedIndex: state.selectedIndex,
                onDestinationSelected: (value) =>
                    context.read<NavigationCubit>().setSelectedIndex(value),
                height: 60.h,
              );
            },
          ),
        ),
      ),
    );
  }
}
