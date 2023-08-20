import 'package:flutter/material.dart';
import 'package:store_user/global_widgets/texts/my_big_text.dart';
import 'package:store_user/global_widgets/texts/my_big_title.dart';
import 'package:store_user/global_widgets/texts/my_text.dart';
import 'package:store_user/data_types/product/product.dart';

class Total extends StatelessWidget {
  const Total({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Column(
          children: [
            MyBigText('total'),
            Text('30'),
          ],
        ),
        ElevatedButton(onPressed: () {}, child: const Text('add to cart'))
      ],
    );
  }
}

class Amount extends StatelessWidget {
  const Amount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.green, shape: BoxShape.circle),
            child: const Icon(Icons.add),
          ),
        ),
        const Text('0'),
        InkWell(
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.green, shape: BoxShape.circle),
            child: const Icon(Icons.remove),
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
