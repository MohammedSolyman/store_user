import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_user/constants/constant.dart';
import 'package:store_user/global_widgets/my_sized_box/my_sized_box.dart';
import 'package:store_user/pages/cart_page/components/purchase_tile.dart';
import 'package:store_user/pages/cart_page/components/total.dart';
import 'package:store_user/pages/orders_page/components.dart/order_tile.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Obx(() => Expanded(
                child: ListView.builder(
                    itemCount: myController.purchaseModel.value.myOrders.length,
                    itemBuilder: (BuildContext context, int index) {
                      return OrderTile(
                          myController.purchaseModel.value.myOrders[index]);
                    }),
              )),
        ],
      ),
    );
  }
}
