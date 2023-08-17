import 'package:flutter/material.dart';
import 'package:store_user/pages/main_gate/components/my_tab_bar.dart';
import 'package:store_user/pages/main_gate/components/my_tab_bar_view.dart';

class MainGate extends StatelessWidget {
  const MainGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: const Center(
          child: DefaultTabController(
        length: 4,
        child: Column(
          children: [
            MyTabBarView(),
            MyTabBar(),
          ],
        ),
      )),
    );
  }
}
