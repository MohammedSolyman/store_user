import 'package:flutter/material.dart';
import 'package:store_user/constants/constant.dart';
import 'package:store_user/global_widgets/texts/my_text.dart';

class MyLine extends StatelessWidget {
  const MyLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const MyText("if you dont't have an accout, click "),
        //  const Text("if you dont't have an accout, click "),
        InkWell(
            onTap: myController.goToSignUp,
            child: const Text(
              'here',
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ))
      ],
    );
  }
}
