import 'package:flutter/material.dart';
import 'package:store_user/constants/constant.dart';
import 'package:store_user/pages/homepage/homepage_components/latest_products_block.dart';
import 'package:store_user/pages/homepage/homepage_components/sale_block.dart';
import 'package:store_user/pages/homepage/homepage_components/scrolling_images.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    myController.restartScrolling();
    return const Column(
      children: [MyScrollingPages(), SaleBlock(), LatestProductsBLock()],
    );
  }
}
