import 'package:flutter/material.dart';

import 'package:store_user/data_types/purchase.dart';
import 'package:store_user/constants/constant.dart';
import 'package:store_user/global_widgets/texts/my_big_text.dart';
import 'package:store_user/global_widgets/texts/my_text.dart';

class PurchaseTile extends StatelessWidget {
  const PurchaseTile(
    this.index,
    this.purchase, {
    super.key,
  });

  final int index;
  final Purchase purchase;
  @override
  Widget build(BuildContext context) {
    DateTime datetime =
        DateTime.fromMillisecondsSinceEpoch(purchase.purchaseTime);
    String stringtime = datetime.toString();
    String time = stringtime.split(' ').first;

    return Row(
      children: [
        Container(
          height: 75,
          width: 75,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(purchase.product!.productImage))),
        ),
        Expanded(
          child: ListTile(
            isThreeLine: true,
            title: MyBigText(purchase.product!.productName),
            subtitle: MyText('\$${purchase.totalPrice}  \n$time'),
          ),
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  myController.editPurchase(purchase, index);
                },
                icon: const Icon(Icons.edit)),
            IconButton(
                onPressed: () {
                  myController.deletePurchace(purchase, index);
                },
                icon: const Icon(Icons.delete))
          ],
        )
      ],
    );
  }
}
