import 'package:flutter/material.dart';
import 'package:store_user/global_widgets/my_sized_box/my_sized_box.dart';
import 'package:store_user/data_types/product/product.dart';
import 'package:store_user/pages/product_details/components/components.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({required this.product, super.key});

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Image.network(product.productImage),
              const MySizedBox(),
              NameAndIcon(product: product),
              const MySizedBox(),
              Price(product: product),
              const MySizedBox(),
              Amount(product.productPrice),
            ],
          ),
          Total(product)
        ],
      ),
    );
  }
}
