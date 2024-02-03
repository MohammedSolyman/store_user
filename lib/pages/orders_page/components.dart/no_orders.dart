import 'package:flutter/material.dart';
import 'package:store_user/global_widgets/texts/my_title.dart';

class NoOrders extends StatelessWidget {
  const NoOrders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            child: Image.asset('assets/icons/shopping_cart.png'),
          ),
          const Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: MyTitle(
                    'there are no items yet, go shopping and buy your favoutire products '),
              ),
            ),
          )
        ],
      ),
    );
  }
}
