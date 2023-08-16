import 'package:flutter/material.dart';
import 'package:store_user/pages/homepage/homepage_components/homepage_componenets.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        MyScrollingPages(),
      ],
    ));
  }
}
