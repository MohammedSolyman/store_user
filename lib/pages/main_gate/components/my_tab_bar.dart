import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          border:
              Border.all(color: Theme.of(context).textTheme.bodyLarge!.color!),
          borderRadius: BorderRadius.circular(15)),
      child: const TabBar(isScrollable: false, tabs: [
        Icon(
          Icons.home,
          size: 35,
        ),
        Icon(
          Icons.grid_view,
          size: 35,
        ),
        Icon(
          Icons.shopping_cart,
          size: 35,
        ),
        Icon(
          Icons.person,
          size: 35,
        ),
      ]),
    );
  }
}
