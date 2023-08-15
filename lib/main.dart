// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_user/pages/homepage/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/homepage',
      getPages: [
        GetPage(name: '/homepage', page: () => Homepage()),
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
