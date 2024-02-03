import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_user/constants/constant.dart';
import 'package:store_user/controllers/my_controller.dart';
import 'package:store_user/global_widgets/my_sized_box/my_sized_box.dart';
import 'package:store_user/pages/homepage/homepage_components/latest_products_block.dart';
import 'package:store_user/pages/homepage/homepage_components/sale_block.dart';
import 'package:store_user/pages/homepage/homepage_components/scrolling_images.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    MyController myController = Get.find<MyController>();
    // myController.restartScrolling();
    return RefreshIndicator(
      onRefresh: () async {
        print('refreshment -----------------------');
        myController.getAllProducts();
      },
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: const Column(
            children: [
              MyScrollingPages(),
              SaleBlock(),
              MySizedBox(),
              LatestProductsBLock(),
            ],
          ),
        ),
      ),
    );
  }
}
