import 'package:flutter/material.dart';
import 'package:store_user/data_types/product.dart';
import 'package:store_user/global_widgets/my_sized_box/my_sized_box.dart';
import 'package:store_user/global_widgets/products/products_grid.dart';
import 'package:store_user/global_widgets/texts/my_big_title.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({required this.dataList, required this.title, super.key});

  final List<Product> dataList;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: [
            const MySizedBox(),
            const MySizedBox(),
            MyBigTitle(title),
            Divider(
                thickness: 3,
                color: Theme.of(context).textTheme.bodyLarge!.color),
            const MySizedBox(),
            ProductsGrid(dataList)
          ],
        ));
  }
}
