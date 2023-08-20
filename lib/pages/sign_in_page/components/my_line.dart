import 'package:flutter/material.dart';
import 'package:store_user/constants/constant.dart';

class MyLine extends StatelessWidget {
  const MyLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("if you dont't have an accout, click "),
        InkWell(
            onTap: myController.goToSignUp,
            child: const Text(
              'here',
              style: TextStyle(color: Colors.blue),
            ))
      ],
    );
  }
}
