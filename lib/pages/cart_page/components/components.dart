import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_user/data_types/purchase.dart';
import 'package:store_user/constants/constant.dart';
import 'package:store_user/global_widgets/my_sized_box/my_sized_box.dart';
import 'package:store_user/global_widgets/texts/my_big_text.dart';
import 'package:store_user/global_widgets/texts/my_text.dart';
import 'package:store_user/global_widgets/texts/my_title.dart';

//

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
                    return MyTile(index,
                        myController.purchaseModel.value.myPurchases[index]);
                  }),
            )),
      ],
    );
  }
}

class Total extends StatelessWidget {
  const Total({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 80,
          child: MyBigText('total'),
        ),
        const SizedBox(
          width: 80,
        ),
        Obx(() => MyBigText(
            '\$ ${myController.productDetailsPageModel.value.grandPrice}'))
      ],
    );
  }
}

class MyTile extends StatelessWidget {
  const MyTile(
    this.index,
    this.purchase, {
    super.key,
  });

  final int index;
  final Purchase purchase;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 75,
          width: 75,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(purchase.product.productImage))),
        ),
        Expanded(
          child: ListTile(
            isThreeLine: true,
            title: MyBigText(purchase.product.productName),
            subtitle: MyText(
                '\$${purchase.totalPrice.toString()} \n\$${purchase.product.productPrice.toString()}/${purchase.product.productUnit}'),
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

class NoPurchases extends StatelessWidget {
  const NoPurchases({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Image.asset('assets/icons/shopping_cart.png'),
        ),
        const Expanded(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: MyTitle(
                  'There is no items yet, go shopping and add your favoutire products '),
            ),
          ),
        )
      ],
    );
  }
}
