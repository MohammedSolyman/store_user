import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_user/controllers/navigation_controller.dart';
import 'package:store_user/data_types/client.dart';
import 'package:store_user/data_types/product.dart';
import 'package:store_user/data_types/purchase.dart';
import 'package:store_user/global_widgets/dialoges/dialoges.dart';
import 'package:store_user/models/product_details_page_model.dart';

class ProductDetailPageController extends NavigationController {
  Rx<ProductDetailsPageModel> productDetailsPageModel =
      ProductDetailsPageModel().obs;

  _addToPurchaseList(
      {required BuildContext context, required Purchase purchase}) {
    //add to cart purchase page

    purchaseModel.update((val) {
      val!.myPurchases.add(purchase);
    });
  }

  _clearFunc() {
    //clear the amount
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
    //delete a purchase form the purchases list
    purchaseModel.update((val) {
      val!.myPurchases.removeAt(index);
    });

    productDetailsPageModel.update((val) {
      val!.grandPrice = val.grandPrice - purchase.totalPrice;
    });
  }

  increaseFunc(int price) {
    //increase the amount of the purchase
    productDetailsPageModel.update((val) {
      val!.amount = val.amount + 1;

      val.totalPrice = (val.amount * price).toDouble();
    });
  }

  decreaseFunc(int price) {
    //decrease the amount of the purchase

    productDetailsPageModel.update((val) {
      if (val!.amount > 0) {
        val.amount = val.amount - 1;
        val.totalPrice = (val.amount * price).toDouble();
      }
    });
  }

  _updateGrandPrice() {
    //update grand price of all purchases
    productDetailsPageModel.update((val) {
      val!.grandPrice = val.grandPrice + val.totalPrice;
    });
  }

  addToCartFunc(BuildContext context, Product product) {
    // prepare this purchase, and add it to purchases list only if :
    // 1. the user are signed in.
    // 2. the amount of the product is more than 0.

    if (FirebaseAuth.instance.currentUser != null) {
      if (productDetailsPageModel.value.amount > 0) {
        int now = DateTime.now().millisecondsSinceEpoch;
        String userId = FirebaseAuth.instance.currentUser!.uid;
        String displayName = FirebaseAuth.instance.currentUser!.displayName!;

        Client client =
            Client(address: '', displayName: displayName, userId: userId);

        Purchase purchase = Purchase(
          client: client,
          product: product,
          purchaseTime: now,
          quantity: productDetailsPageModel.value.amount,
          totalPrice: productDetailsPageModel.value.totalPrice,
        );

        _updateGrandPrice();
        _addToPurchaseList(context: context, purchase: purchase);
        goToCartPage();
        _clearFunc();
      } else {
        showMyDialoge(
            context: context,
            col: Colors.orange,
            title: 'sorry',
            content: 'amount can NOT be 0');
      }
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
    //delete thsi purchase from purchases list and go to the product details, along with the
    //same data of deleted purchase

    deletePurchace(purchase, index);
    _setFunc(purchase);
    goToProductTetails(purchase.product!);
  }
}
