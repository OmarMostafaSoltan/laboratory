import 'package:almokhtabarlab/custom_widgets/customappbar.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(title: 'Search'),
            Center(
              child: Text('search'),
            ),
          ],
        ),
      ),
    );
  }
}