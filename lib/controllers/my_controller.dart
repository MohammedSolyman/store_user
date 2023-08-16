/*
ScrollingImagesController
ProductsController
ThemeController

MyController
*/

import 'package:get/get.dart';
import 'package:store_user/controllers/theme_controller.dart';

class MyController extends ThemeController {
  static MyController instance = Get.find<MyController>();
}
