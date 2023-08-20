import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_user/constants/constant.dart';
import 'package:store_user/global_widgets/products/product_template.dart';
import 'package:store_user/data_types/product/product.dart';

class ProductsTemplate extends StatelessWidget {
  const ProductsTemplate(
      {required this.countPerLine, required this.dataList, super.key});

  final int countPerLine;
  final List<Product> dataList;

  @override
  Widget build(BuildContext context) {
    return dataList.isEmpty
        ? const Text('there is no products')
        : SizedBox(
            height: 175,
            child: GridView.builder(
                itemCount: dataList.length,
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: countPerLine,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 175,
                ),
                itemBuilder: (BuildContext context, int index) {
                  Product myProduct = dataList[index];
                  return ProductTemplate(myProduct);
                }),
          );
  }
}

class SaleProductsTemplate extends StatelessWidget {
  const SaleProductsTemplate({required this.countPerLine, super.key});

  final int countPerLine;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ProductsTemplate(
        countPerLine: countPerLine,
        dataList: myController.productsModel.value.onSaleProducts,
      );
    });
  }
}

class LatestProductsTemplate extends StatelessWidget {
  const LatestProductsTemplate({required this.countPerLine, super.key});

  final int countPerLine;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ProductsTemplate(
        countPerLine: countPerLine,
        dataList: myController.productsModel.value.latestProducts,
      );
    });
  }
}
