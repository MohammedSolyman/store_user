import 'package:flutter/material.dart';
import 'package:store_user/pages/categories_page/components/categories_template.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 35,
        ),
        CategoriesTemplate()
      ],
    );
  }
}
