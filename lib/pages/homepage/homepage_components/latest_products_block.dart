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
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColorDark,
              borderRadius: BorderRadius.circular(5)),
          margin: const EdgeInsets.all(3),
          padding: const EdgeInsets.all(3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const MyText('Latest products'),
              ElevatedButton(
                  onPressed: () {
                    myController.goToProductsPage(
                        myController.dataModel.value.latestProducts,
                        'latest products');
                  },
                  child: const Text('view all'))
            ],
          ),
        ),
        Obx(() {
          if (myController.dataModel.value.latestProductsShort.isEmpty) {
            return const MyText('there are no products');
          } else {
            return const LatestProductsTemplate(countPerLine: 1);
          }
        })
      ],
    );
  }
}
