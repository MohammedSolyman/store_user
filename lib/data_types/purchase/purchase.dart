//myController.purchasesModel.value.purchases

import 'package:store_user/constants/constant.dart';

class Purchase {
  String userName = '';
  String productName = '';
  int quantity = 0;
  String measureUnit = Unit.kilo;
  double totalPrice = 0;

  Purchase({
    required this.userName,
    required this.productName,
    required this.quantity,
    required this.measureUnit,
    required this.totalPrice,
  });
}
