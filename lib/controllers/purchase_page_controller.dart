import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_user/controllers/sign_up_page_controller.dart';
import 'package:store_user/data_types/product/product.dart';
import 'package:store_user/data_types/purchase/purchase.dart';
import 'package:store_user/global_widgets/dialoges/dialoges.dart';
import 'package:store_user/models/product_details_page_model.dart';

class ProductDetailPageController extends SignUpPageController {
  Rx<ProductDetailsPageModel> productDetailsPageModel =
      ProductDetailsPageModel().obs;

  _clearFunc() {
    productDetailsPageModel.update((val) {
      val!.amount = 0;
      val.totalPrice = 0;
    });
  }

  _setFunc(Purchase purchase) {
    productDetailsPageModel.update((val) {
      val!.amount = purchase.quantity;
      val.totalPrice = purchase.totalPrice;
    });
  }

  deletePurchace(Purchase purchase, int index) {
    purchaseModel.update((val) {
      val!.myPurchases.removeAt(index);
    });

    productDetailsPageModel.update((val) {
      val!.grandPrice = val.grandPrice - purchase.totalPrice;
    });
  }

  increaseFunc(int price) {
    productDetailsPageModel.update((val) {
      val!.amount = val.amount + 1;

      val.totalPrice = (val.amount * price).toDouble();
    });
  }

  decreaseFunc(int price) {
    productDetailsPageModel.update((val) {
      if (val!.amount > 0) {
        val.amount = val.amount - 1;
        val.totalPrice = (val.amount * price).toDouble();
      }
    });
  }

  updateGrandPrice() {
    productDetailsPageModel.update((val) {
      val!.grandPrice = val.grandPrice + val.totalPrice;
    });
  }

  addToCartFunc(BuildContext context, Product product) {
    if (FirebaseAuth.instance.currentUser != null) {
      int now = DateTime.now().millisecondsSinceEpoch;
      String userId = FirebaseAuth.instance.currentUser!.uid;

      Purchase purchase = Purchase(
        product: product,
        purchaseTime: now,
        quantity: productDetailsPageModel.value.amount,
        totalPrice: productDetailsPageModel.value.totalPrice,
        userId: userId,
      );

      updateGrandPrice();
      addToPurchaseList(purchase);
      goToCartPage();
      _clearFunc();
    } else {
      showMyDialoge(
          context: context,
          col: Colors.orange,
          title: 'sorry',
          content: 'sign in first to be able to add to your cart');
      _clearFunc();
    }
  }

  editPurchase(Purchase purchase, int index) {
    deletePurchace(purchase, index);
    _setFunc(purchase);
    goToProductTetails(purchase.product);
  }
}
