import 'package:flutter/material.dart';
import 'package:store_user/constants/constant.dart';
import 'package:store_user/global_widgets/category/categories_template.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 35,
        ),
        CategoriesTemplate(dataList: MyCategories.categoryList)
      ],
    );
  }
}