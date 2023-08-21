import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_user/controllers/sign_up_page_controller.dart';
import 'package:store_user/data_types/product/product.dart';
import 'package:store_user/data_types/purchase/purchase.dart';
import 'package:store_user/global_widgets/dialoges/dialoges.dart';
import 'package:store_user/models/product_details_page_model.dart';

class ProductDetailPageController extends SignUpPageController {
  Rx<ProductDetailsPageModel> purchasePageModel = ProductDetailsPageModel().obs;

  increaseFunc(int price) {
    purchasePageModel.update((val) {
      val!.amount = val.amount + 1;

      val.totalPrice = (val.amount * price).toDouble();
    });
  }

  decreaseFunc(int price) {
    purchasePageModel.update((val) {
      if (val!.amount > 0) {
        val.amount = val.amount - 1;
        val.totalPrice = (val.amount * price).toDouble();
      }
    });
  }

  addToCartFunc(BuildContext context, Product product) {
    if (FirebaseAuth.instance.currentUser != null) {
      int now = DateTime.now().millisecondsSinceEpoch;
      String userId = FirebaseAuth.instance.currentUser!.uid;

      Purchase purchase = Purchase(
          measureUnit: product.productUnit,
          productName: product.productName,
          purchaseTime: now,
          quantity: purchasePageModel.value.amount,
          totalPrice: purchasePageModel.value.totalPrice,
          userId: userId);

      addToPurchaseList(purchase);
      goToCartPage();
    } else {
      showMyDialoge(
          context: context,
          col: Colors.orange,
          title: 'sorry',
          content: 'sign in first to be able to add to your cart');
    }
  }
}
