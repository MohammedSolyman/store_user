//myController.purchasesModel.value.purchases

import 'package:store_user/constants/constant.dart';

class Purchase {
  String userId = '';
  String productName = '';
  int quantity = 0;
  String measureUnit = Unit.kilo;
  double totalPrice = 0;
  double price = 0;
  int purchaseTime = 0;
  String productImage = '';

  Purchase({
    required this.userId,
    required this.productName,
    required this.quantity,
    required this.measureUnit,
    required this.totalPrice,
    required this.price,
    required this.purchaseTime,
    required this.productImage,
  });
}
