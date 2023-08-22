import 'package:flutter/material.dart';
import 'package:store_user/constants/constant.dart';
import 'package:store_user/data_types/product.dart';
import 'package:store_user/global_widgets/texts/my_title.dart';
import 'package:store_user/data_types/category.dart';

class CategoryTemplate extends StatelessWidget {
  const CategoryTemplate({required this.category, super.key});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        List<Product> dataList = myController.getCategoryProducts(category);
        myController.goToProductsPage(dataList, category.categoryName);
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width * 0.45,
        height: MediaQuery.of(context).size.height * 0.25,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.30,
                      height: MediaQuery.of(context).size.height * 0.13,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(category.categoryImage))),
                    ),
                    MyTitle(category.categoryName)
                  ],
                ),
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    const Color.fromARGB(255, 249, 249, 248).withOpacity(0.2),
                    const Color.fromARGB(255, 242, 132, 132).withOpacity(0.2),
                    const Color.fromARGB(255, 162, 147, 238).withOpacity(0.2),
                  ]),
                  borderRadius: BorderRadius.circular(15),
                )),
          ],
        ),
      ),
    );
  }
}
