import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_user/constants/constant.dart';
import 'package:store_user/global_widgets/my_sized_box/my_sized_box.dart';
import 'package:store_user/global_widgets/products/products_horizontal/products_template.dart';

import 'package:store_user/global_widgets/texts/my_text.dart';

class LatestProductsBLock extends StatelessWidget {
  const LatestProductsBLock({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MySizedBox(),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText('Latest products'),
            //   ElevatedButton(onPressed: () {}, child: const Text('view all'))
          ],
        ),
        const MySizedBox(),
        Obx(() {
          if (myController.dataModel.value.allProducts.isEmpty) {
            return const MyText('there is no products');
          } else {
            return const Column(
              children: [SaleProductsTemplate(countPerLine: 1)],
            );
          }
        })
      ],
    );
  }
}
