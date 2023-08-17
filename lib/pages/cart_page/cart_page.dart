import 'package:flutter/material.dart';
import 'package:store_user/constants/constant.dart';
import 'package:store_user/global_widgets/texts/my_title.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (myController.purchaseDataModel.value.myPurchases.isEmpty) {
      return Column(
        children: [
          SizedBox(
            child: Image.asset('assets/icons/shopping_cart.png'),
          ),
          const Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: MyTitle(
                    'There is no items yet, go shopping and add your favoutire products '),
              ),
            ),
          )
        ],
      );

      // return Text(' there is no purchases ..');
    }

    return const Text(' purchases ..');
  }
}
