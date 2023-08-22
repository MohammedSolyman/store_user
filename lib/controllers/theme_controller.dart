import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:store_user/controllers/data_controller.dart';
import 'package:store_user/models/theme_model.dart';

class ThemeController extends DataController {
  Rx<ThemeModel> themeModel = ThemeModel().obs;

  void toggleMode(bool x) async {
    final GetStorage box = GetStorage();

    themeModel.update((val) async {
      val!.themeModeBool = x;
      if (x == true) {
        val.themeMode = ThemeMode.light;
        await box.write('theme', "light");
      } else {
        val.themeMode = ThemeMode.dark;
        await box.write('theme', "dark");
      }
    });
  }

  onInitTheme() async {
    final GetStorage box = GetStorage();
    String theme = box.read('theme');
    themeModel.update((val) {
      if (theme == 'dark') {
        val!.themeMode = ThemeMode.dark;
        val.themeModeBool = false;
      } else {
        val!.themeMode = ThemeMode.light;
      }
    });
  }
}
