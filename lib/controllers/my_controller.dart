/*
ScrollingImagesController
DataController
ThemeController
PurchaseController
NavigationController
Authentication
SignInPageController
SignUpPageController
PirchasePage


MyController
*/

import 'package:get/get.dart';
import 'package:store_user/controllers/purchase_page_controller.dart';

class MyController extends ProductDetailPageController {
  static MyController instance = Get.find<MyController>();

  @override
  void onInit() async {
    super.onInit();

    onInitTheme();

    await getAllProducts();
    updateCurrentUser();
  }
}
