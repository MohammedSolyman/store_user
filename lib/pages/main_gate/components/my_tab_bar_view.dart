import 'package:flutter/material.dart';
import 'package:store_user/pages/cart_page/cart_page.dart';
import 'package:store_user/pages/categories_page/categories_page.dart';
import 'package:store_user/pages/homepage/homepage.dart';
import 'package:store_user/pages/profile_page/profile_page.dart';

class MyTabBarView extends StatelessWidget {
  const MyTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: TabBarView(children: [
        HomePage(),
        CategoriesPage(),
        CartPage(),
        ProfilePage(),
      ]),
    );
  }
}
