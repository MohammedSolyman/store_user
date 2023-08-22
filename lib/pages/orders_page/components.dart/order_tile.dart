import 'package:flutter/material.dart';
import 'package:store_user/data_types/purchase.dart';
import 'package:store_user/global_widgets/texts/my_big_text.dart';
import 'package:store_user/global_widgets/texts/my_text.dart';

class OrderTile extends StatelessWidget {
  const OrderTile(
    this.purchase, {
    super.key,
  });

  final Purchase purchase;
  @override
  Widget build(BuildContext context) {
    int intTime = purchase.purchaseTime;
    DateTime time = DateTime.fromMillisecondsSinceEpoch(intTime);
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
            subtitle: MyText('\$${purchase.totalPrice}  \n${time.toString()}'),
          ),
        ),
      ],
    );
  }
}
