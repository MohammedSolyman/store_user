import 'package:flutter/material.dart';
import 'package:store_user/pages/homepage/homepage.dart';

class MyTabBarView extends StatelessWidget {
  const MyTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: TabBarView(children: [
        HomePage(),
        Text('tab bar view 2'),
        Text('tab bar view 3'),
        Text('tab bar view 4'),
      ]),
    );
  }
}
