import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_user/constants/constant.dart';

import 'package:store_user/global_widgets/texts/my_big_text.dart';
import 'package:store_user/global_widgets/texts/my_big_title.dart';
import 'package:store_user/global_widgets/texts/my_text.dart';
import 'package:store_user/data_types/product.dart';

class Total extends StatelessWidget {
  const Total(
    this.product, {
    super.key,
  });

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            const MyBigText('total'),
            Obx(() {
              return MyBigText(myController
                  .productDetailsPageModel.value.totalPrice
                  .toString());
            }),
          ],
        ),
        ElevatedButton(
            onPressed: () {
              myController.addToCartFunc(context, product);
            },
            child: const Text('add to cart'))
      ],
    );
  }
}

class Amount extends StatelessWidget {
  const Amount(
    this.price, {
    super.key,
  });
  final int price;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            myController.increaseFunc(price);
          },
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.green, shape: BoxShape.circle),
            child: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Obx(() {
          return MyBigText(
              myController.productDetailsPageModel.value.amount.toString());
        }),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            myController.decreaseFunc(price);
          },
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.green, shape: BoxShape.circle),
            child: const Icon(
              Icons.remove,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}

class Price extends StatelessWidget {
  const Price({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyBigText('\$ ${product.productPrice}'),
        MyText('/${product.productUnit}'),
      ],
    );
  }
}

class NameAndIcon extends StatelessWidget {
  const NameAndIcon({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyBigTitle(product.productName),
        IconButton(onPressed: () {}, icon: const Icon(Icons.favorite))
      ],
    );
  }
}
