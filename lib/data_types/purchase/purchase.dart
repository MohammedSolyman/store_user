import 'package:store_user/data_types/product/product.dart';

class Purchase {
  Product product;
  String userId = '';
  int quantity = 0;
  double totalPrice = 0;
  int purchaseTime = 0;

  Purchase({
    required this.product,
    required this.userId,
    required this.quantity,
    required this.totalPrice,
    required this.purchaseTime,
  });
}
