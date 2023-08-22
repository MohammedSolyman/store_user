import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_user/constants/constant.dart';
import 'package:store_user/global_widgets/my_sized_box/my_sized_box.dart';
import 'package:store_user/pages/cart_page/components/purchase_tile.dart';
import 'package:store_user/pages/cart_page/components/total.dart';

class Purchases extends StatelessWidget {
  const Purchases({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MySizedBox(),
        const MySizedBox(),
        const Total(),
        Obx(() => Expanded(
              child: ListView.builder(
                  itemCount:
                      myController.purchaseModel.value.myPurchases.length,
                  itemBuilder: (BuildContext context, int index) {
                    return PurchaseTile(index,
                        myController.purchaseModel.value.myPurchases[index]);
                  }),
            )),
      ],
    );
  }
}
