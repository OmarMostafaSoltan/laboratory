import 'package:almokhtabarlab/custom_widgets/customappbar.dart';
import 'package:almokhtabarlab/routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomAppBar(title: 'Welcome Omar'),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 200.0),
              child: Text(' our services',style: TextStyle(fontSize: 15 ,color: Colors.blueGrey),),
            ),
            SizedBox(
              height: 500,
              width: 400,
              child: ListTileTheme(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ListView.builder(
                    padding: const EdgeInsets.only(top: 10,right:20.0,left: 20.0),
                    itemCount: servicesList.length,
                    itemBuilder: (context, index) {
                      final itemServices = servicesList[index];
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ListTile(
                          leading: Icon(itemServices['icon']),
                          trailing: const Icon(Icons.arrow_forward),
                          title: Text(itemServices['title']),
                          onTap: () {
                            Navigator.pushNamed(context, itemServices['route']);
                          },
                          tileColor: Colors.white,
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
