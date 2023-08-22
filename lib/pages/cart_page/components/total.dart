import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_user/constants/constant.dart';
import 'package:store_user/global_widgets/texts/my_big_text.dart';

class Total extends StatelessWidget {
  const Total({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(() => MyBigText(
            'total: \$ ${myController.productDetailsPageModel.value.grandPrice}')),
        ElevatedButton(
            onPressed: () async {
              await myController.buy();
            },
            child: const MyBigText('buy'))
      ],
    );
  }
}
