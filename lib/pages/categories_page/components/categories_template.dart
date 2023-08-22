import 'package:flutter/material.dart';
import 'package:store_user/data_types/category.dart';
import 'package:store_user/pages/categories_page/components/category_template.dart';

class CategoriesTemplate extends StatelessWidget {
  const CategoriesTemplate({required this.dataList, super.key});

  final List<Category> dataList;

  @override
  Widget build(BuildContext context) {
    return dataList.isEmpty
        ? const Text('there is no categories')
        : Expanded(
            child: GridView.builder(
                itemCount: dataList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (BuildContext contex, int index) {
                  return CategoryTemplate(category: dataList[index]);
                }),
          );
  }
}
