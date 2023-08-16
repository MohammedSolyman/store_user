import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TabBar(tabs: [
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
    ]);
  }
}
