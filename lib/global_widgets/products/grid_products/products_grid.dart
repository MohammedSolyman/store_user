import 'package:flutter/material.dart';
import 'package:store_user/data_types/product.dart';
import 'package:store_user/global_widgets/products/products_horizontal/product_template.dart';
import 'package:store_user/global_widgets/texts/my_text.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid(this.dataList, {super.key});
  final List<Product> dataList;
  @override
  Widget build(BuildContext context) {
    if (dataList.isEmpty) {
      return const MyText('there is no products yet');
    } else {
      return Expanded(
        child: GridView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: dataList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
            itemBuilder: (BuildContext context, int index) {
              return ProductTemplate(dataList[index]);
            }),
      );
    }
  }
}
