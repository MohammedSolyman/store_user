import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:store_user/Theming/my_themes.dart';
import 'package:store_user/constants/constant.dart';
import 'package:store_user/controllers/my_controller.dart';
import 'package:store_user/pages/main_gate/main_gate.dart';

/*

categories pages was fixed, product tetails page was fixed
 
 git push https://github.com/MohammedSolyman/store_user.git master

*/
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  Get.put(MyController());

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
          themeMode: myController.themeModel.value.themeMode,
          theme: MyThemeData.light,
          darkTheme: MyThemeData.dark,
          initialRoute: '/maingate',
          getPages: [
            GetPage(name: '/maingate', page: () => const MainGate()),
          ],
        ));
  }
}
