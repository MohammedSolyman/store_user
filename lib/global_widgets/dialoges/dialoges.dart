import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_user/global_widgets/texts/my_text.dart';

Future<void> showMyDialoge(
    {required BuildContext context,
    required Color col,
    required,
    required String title,
    required content}) async {
  await Get.defaultDialog(
      title: title,
      titleStyle: Theme.of(context).textTheme.bodyLarge,
      backgroundColor: col.withOpacity(0.5),
      content: MyText(content));
}
