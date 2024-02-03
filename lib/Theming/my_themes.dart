import 'package:flutter/material.dart';
import 'package:store_user/constants/my_colors.dart';

class MyThemeData {
  static final ThemeData light = ThemeData(
      elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.blue),
              foregroundColor: MaterialStatePropertyAll(Colors.white))),
      iconTheme: const IconThemeData(color: MyColors.text1),
      textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16, color: MyColors.text1),
          headlineLarge: TextStyle(
              fontSize: 20, color: MyColors.text1, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(
            fontSize: 30,
            color: MyColors.text1,
          )),
      primaryColor: MyColors.background1,
      primaryColorDark: MyColors.borders1);

  static final ThemeData dark = ThemeData(
      elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.black),
              foregroundColor: MaterialStatePropertyAll(Colors.white))),
      iconTheme: const IconThemeData(color: MyColors.text2),
      textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16, color: MyColors.text2),
          headlineLarge: TextStyle(
              fontSize: 20, color: MyColors.text2, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(
            fontSize: 30,
            color: MyColors.text2,
          )),
      primaryColor: MyColors.background2,
      primaryColorDark: MyColors.borders2);
}
