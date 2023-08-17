//myController.purchasesModel.value.purchases

import 'package:store_user/constants/constant.dart';

class PurchaseModel {
  String userName = '';
  String productName = '';
  int quantity = 0;
  String measureUnit = Unit.kilo;
  double totalPrice = 0;

  PurchaseModel({
    required this.userName,
    required this.productName,
    required this.quantity,
    required this.measureUnit,
    required this.totalPrice,
  });
}
