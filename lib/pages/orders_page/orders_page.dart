import 'package:flutter/material.dart';
import 'package:store_user/constants/constant.dart';
import 'package:store_user/global_widgets/my_sized_box/my_sized_box.dart';
import 'package:store_user/global_widgets/texts/my_big_title.dart';
import 'package:store_user/pages/orders_page/components.dart/no_orders.dart';
import 'package:store_user/pages/orders_page/components.dart/orders.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          const MySizedBox(),
          const MySizedBox(),
          MyBigTitle('my orders'),
          Divider(
              thickness: 3,
              color: Theme.of(context).textTheme.bodyLarge!.color),
          const MySizedBox(),
          OrdersBody()
        ],
      ),
    );
  }
}

class OrdersBody extends StatelessWidget {
  const OrdersBody({super.key});

  @override
  Widget build(BuildContext context) {
    if (myController.purchaseModel.value.myOrders.isEmpty) {
      return const NoOrders();
    } else {
      return const Orders();
    }
  }
}
