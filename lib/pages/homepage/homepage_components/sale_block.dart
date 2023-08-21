import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_user/constants/constant.dart';
import 'package:store_user/global_widgets/products/products_template.dart';
import 'package:store_user/global_widgets/texts/my_text.dart';

class SaleBlock extends StatelessWidget {
  const SaleBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const MyText('On sale'),
            ElevatedButton(
                onPressed: () {
                  myController.productsModel.value.onSaleProducts =
                      myController.getSaleProducts();
                },
                child: const Text('view all'))
          ],
        ),
        Obx(() {
          if (myController.productsModel.value.allProducts.isEmpty) {
            return const MyText('there is no products');
          } else {
            return const Column(
              children: [
                LatestProductsTemplate(
                  countPerLine: 1,
                )
              ],
            );
          }
        })
      ],
    );
  }
}
