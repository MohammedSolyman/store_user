import 'package:flutter/material.dart';
import 'package:store_user/constants/constant.dart';
import 'package:store_user/pages/categories_page/components/category_template.dart';

class CategoriesTemplate extends StatelessWidget {
  const CategoriesTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          itemCount: MyCategories.categoryList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (BuildContext contex, int index) {
            return CategoryTemplate(category: MyCategories.categoryList[index]);
          }),
    );
  }
}
