import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_user/controllers/purchase_controller.dart';
import 'package:store_user/data_types/product.dart';
import 'package:store_user/pages/main_gate/main_gate.dart';
import 'package:store_user/pages/orders_page/orders_page.dart';
import 'package:store_user/pages/product_details/product_details.dart';
import 'package:store_user/pages/products_page/products_page.dart';
import 'package:store_user/pages/sign_in_page/sign_in_page.dart';
import 'package:store_user/pages/sign_up_page/sign_up_page.dart';

class NavigationController extends PurchaseController {
  void goToProductTetails(Product product) {
    Get.to(ProductDetails(product: product));
  }

  void goToSignIn() {
    Get.to(const SignInPage());
  }

  void goToSignUp() {
    Get.to(() => const SignUpPage());
  }

  void goToCartPage() {
    Get.to(() => const MainGate(index: 2));
  }

  void goToProductsPage(List<Product> dataList, String title) {
    Get.to(() => ProductsPage(
          dataList: dataList,
          title: title,
        ));
  }

  void goToWishListPage() {
    goToProductsPage(dataModel.value.wishList.toList(), 'wishlist products');
  }

  void goToOrdersPage() {
    Get.to(() => const OrdersPage());
  }

  Future<bool> onWillPop() async {
    return await Get.defaultDialog(
        content: const Text('do you want to exit the app'),
        actions: [
          ElevatedButton(
              onPressed: () {
                return Get.back<bool>(result: false);
              },
              child: const Text('no')),
          ElevatedButton(
              onPressed: () {
                return Get.back<bool>(result: true);
              },
              child: const Text('yes')),
        ]);
  }
}
