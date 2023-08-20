import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_user/controllers/products_controller.dart';
import 'package:store_user/models/theme_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends ProductsController {
  Rx<ThemeModel> themeModel = ThemeModel().obs;

  void toggleMode(bool x) async {
    themeModel.update((val) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      val!.themeModeBool = x;

      if (x == true) {
        val.themeMode = ThemeMode.light;
        await prefs.setString("theme", "light");
      } else {
        val.themeMode = ThemeMode.dark;
        await prefs.setString("theme", "dark");
      }
    });
  }

  updateTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? theme = prefs.getString('theme');

    themeModel.update((val) {
      if (theme == 'dark') {
        val!.themeMode = ThemeMode.dark;
      } else {
        val!.themeMode = ThemeMode.light;
      }
    });
  }
}
