import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_user/Theming/my_themes.dart';
import 'package:store_user/constants/constant.dart';
import 'package:store_user/controllers/my_controller.dart';
import 'package:store_user/pages/main_gate/main_gate.dart';

/*
main template with tabbarview was created, 
homepage was added
theming was added
*/
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Get.put(MyController());

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: myController.themeModel.value.themeMode,
      theme: MyThemeData.light,
      darkTheme: MyThemeData.dark,
      initialRoute: '/maingate',
      getPages: [
        GetPage(name: '/maingate', page: () => const MainGate()),
        // GetPage(name: '/test', page: () => Test()),

        // GetPage(name: '/allproducts', page: () => AllProducts()),
        // GetPage(name: '/categories', page: () => Categories()),
        // GetPage(name: '/cart', page: () => Cart()),
        // GetPage(name: '/signin', page: () => SignIn()),
        // GetPage(name: '/profile', page: () => Profile()),
        // GetPage(name: '/onsale', page: () => onSale()),
        // GetPage(name: '/addproduct', page: () => AddProduct()),
      ],
    );
  }
}
