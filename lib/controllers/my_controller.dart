/*
ScrollingImagesController
DataController
ThemeController
PurchaseController
NavigationController
Authentication
SignInPageController
SignUpPageController
PurchasePage


MyController
*/

import 'package:get/get.dart';
import 'package:store_user/controllers/sign_up_page_controller.dart';

class MyController extends SignUpPageController {
  static MyController instance = Get.find<MyController>();

  @override
  void onInit() async {
    super.onInit();
    onInitTheme();
    await getAllProducts();
    await getAllOrders();
    // getLatestProducts();
    updateCurrentUser();
  }
}
