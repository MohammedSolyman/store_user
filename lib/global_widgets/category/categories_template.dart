import 'package:flutter/material.dart';
import 'package:store_user/global_widgets/category/category_template.dart';
import 'package:store_user/data_types/category/category.dart';

class CategoriesTemplate extends StatelessWidget {
  const CategoriesTemplate({required this.dataList, super.key});

  final List<Category> dataList;

  @override
  Widget build(BuildContext context) {
    return dataList.isEmpty
        ? const Text('there is no categories')
        : SizedBox(
            height: 175,
            child: Wrap(
              children: List.generate(dataList.length, (index) {
                return CategoryTemplate(category: dataList[index]);
              }),
            )

            //  GridView.builder(
            //     itemCount: dataList.length,
            //     scrollDirection: Axis.horizontal,
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2,
            //       mainAxisSpacing: 10,
            //    //   mainAxisExtent: 200,
            //     ),
            //     itemBuilder: (BuildContext context, int index) {
            //       return CategoryTemplate(Category: dataList[index]);
            //     }),

            );
  }
}