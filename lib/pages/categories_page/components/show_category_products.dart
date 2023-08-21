import 'package:flutter/material.dart';
import 'package:store_user/data_types/product/product.dart';
import 'package:store_user/global_widgets/my_sized_box/my_sized_box.dart';
import 'package:store_user/global_widgets/products/product_template.dart';
import 'package:store_user/global_widgets/texts/my_big_title.dart';
import 'package:store_user/global_widgets/texts/my_text.dart';

class ShowCategoryProducts extends StatelessWidget {
  const ShowCategoryProducts(
      {required this.dataList, required this.categorName, super.key});

  final List<Product> dataList;
  final String categorName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: [
            const MySizedBox(),
            const MySizedBox(),
            MyBigTitle(categorName),
            Divider(
                thickness: 3,
                color: Theme.of(context).textTheme.bodyLarge!.color),
            const MySizedBox(),
            Contents(dataList)
          ],
        ));
  }
}

class Contents extends StatelessWidget {
  const Contents(this.dataList, {super.key});
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
