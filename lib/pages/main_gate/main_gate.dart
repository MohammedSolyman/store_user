import 'package:flutter/material.dart';
import 'package:store_user/constants/constant.dart';
import 'package:store_user/pages/main_gate/components/my_tab_bar.dart';
import 'package:store_user/pages/main_gate/components/my_tab_bar_view.dart';

class MainGate extends StatelessWidget {
  const MainGate({this.index, super.key});

  final int? index;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: myController.onWillPop

      // () async {
      //   return await showDialog(
      //     context: context,
      //     builder: (context) {
      //       return AlertDialog(
      //         content: Text('do you want to exit the app'),
      //         actions: [
      //           ElevatedButton(
      //               onPressed: () {
      //                 return Navigator.pop<bool>(context, false);
      //               },
      //               child: Text('no')),
      //           ElevatedButton(
      //               onPressed: () {
      //                 return Navigator.pop<bool>(context, true);
      //               },
      //               child: Text('yes')),
      //         ],
      //       );
      //     },
      //   );
      // },
      ,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
            child: DefaultTabController(
          initialIndex: index ?? 0,
          length: 4,
          child: const Column(
            children: [
              MyTabBarView(),
              MyTabBar(),
            ],
          ),
        )),
      ),
    );
  }
}
