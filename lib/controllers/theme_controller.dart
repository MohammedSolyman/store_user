import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_user/controllers/products_controller.dart';
import 'package:store_user/models/theme/theme_model.dart';

class ThemeController extends ProductsController {
  Rx<ThemeModel> themeModel = ThemeModel().obs;
  static ThemeController themeInstance = Get.find<ThemeController>();

  void toggleMode(bool x) {
    themeModel.update((val) {
      val!.themeModeBool = x;

      if (x == true) {
        val.themeMode = ThemeMode.light;
      } else {
        val.themeMode = ThemeMode.dark;
      }
    });
  }
}
