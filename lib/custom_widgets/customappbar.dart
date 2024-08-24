import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 8.0),
      child: Container(
        color: Colors.white,
        width: double.infinity,
        height: 45,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(alignment: AlignmentDirectional.centerEnd, children: [
              IconButton(
                  iconSize: 25,
                  onPressed: () {
                    Navigator.pushNamed(context, 'notifications');
                  },
                  icon: const Icon(Icons.notifications_active_outlined)),
              SizedBox(
                width: 10,
                child: IconButton(
                    iconSize: 25,
                    onPressed: () {
                      Navigator.pushNamed(context, 'shoppingcard');
                    },
                    icon: const Icon(Icons.shopping_cart_checkout_outlined)),
              ),
            ]),
            const SizedBox(
              width: 80,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(title),
            ),
          ],
        ),
      ),
    );
  }
}
