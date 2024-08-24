
import 'package:almokhtabarlab/layout/cubit/navigation_cubit.dart';
import 'package:almokhtabarlab/pages_nav_bar/about.dart';
import 'package:almokhtabarlab/pages_nav_bar/branches.dart';
import 'package:almokhtabarlab/pages_nav_bar/homepage.dart';
import 'package:almokhtabarlab/pages_nav_bar/more.dart';
import 'package:almokhtabarlab/pages_nav_bar/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                return  const Branches();
          
              case 4:
                return const More();
          
              default:
                return const SizedBox();
            }
                        }),
          bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
            builder: (context, state) {
              return NavigationBar(
                destinations: const [
                  NavigationDestination(
                    icon: Icon(Icons.home_outlined),
                    label: 'Home',
                    selectedIcon: Icon(Icons.home_filled),
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.search_outlined),
                    label: 'Search',
                    selectedIcon: Icon(Icons.search),
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.info_outline),
                    label: 'About',
                    selectedIcon: Icon(Icons.info),
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.location_city),
                    label: 'Branches',
                    selectedIcon: Icon(Icons.location_on),
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.menu_outlined),
                    label: 'More',
                    selectedIcon: Icon(Icons.menu),
                  )
                ],
                selectedIndex: state.selectedIndex,
                onDestinationSelected: (value) =>
                    context.read<NavigationCubit>().setSelectedIndex(value),
                height: 60,
              );
            },
          ),
        ),
      ),
    );
  }
}
