import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_user/constants/constant.dart';
import 'package:store_user/global_widgets/forms/forms.dart';

Future<void> showAddressDialoge({required BuildContext context}) async {
  await Get.defaultDialog(
    title: 'your adress',
    titleStyle: Theme.of(context).textTheme.bodyLarge,
    backgroundColor: Colors.blue.withOpacity(0.7),
    content: MyForm(
        controller: myController.authenticationModel.value.tecAddress,
        label: 'your address'),
    onCancel: () {
      Get.back();
    },
    onConfirm: () {
      myController.authenticationModel.update((val) {
        val!.address = val.tecAddress.text;
      });
      Get.back();
    },
  );
}
