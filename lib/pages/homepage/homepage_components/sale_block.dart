import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_user/constants/constant.dart';
import 'package:store_user/global_widgets/products/products_horizontal/products_template.dart';

import 'package:store_user/global_widgets/texts/my_text.dart';

class SaleBlock extends StatelessWidget {
  const SaleBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColorDark,
              borderRadius: BorderRadius.circular(5)),
          margin: const EdgeInsets.all(3),
          padding: const EdgeInsets.all(3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const MyTextHead('On sale'),
              ElevatedButton(
                  onPressed: () {
                    myController.goToProductsPage(
                        myController.dataModel.value.onSaleProducts, 'on sale');
                  },
                  child: const Text('view all'))
            ],
          ),
        ),
        Obx(() {
          if (myController.dataModel.value.onSaleProductsShort.isEmpty) {
            return const MyText('there are no sale products');
          } else {
            return const SaleProductsTemplate(countPerLine: 1);
          }
        })
      ],
    );
  }
}
