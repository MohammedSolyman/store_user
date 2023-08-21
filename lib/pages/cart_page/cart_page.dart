import 'package:flutter/material.dart';
import 'package:store_user/constants/constant.dart';
import 'package:store_user/pages/cart_page/components/components.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (myController.purchaseModel.value.myPurchases.isEmpty) {
      return const NoPurchases();
    } else {
      return const Purchases();
    }
  }
}
