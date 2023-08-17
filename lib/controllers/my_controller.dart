/*
ScrollingImagesController
ProductsController
ThemeController
PurchaseController


MyController
*/

import 'package:get/get.dart';
import 'package:store_user/controllers/purchase_controller.dart';

class MyController extends PurchaseController {
  static MyController instance = Get.find<MyController>();
}
