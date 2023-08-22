import 'package:store_user/data_types/client.dart';
import 'package:store_user/data_types/product.dart';

class Purchase {
  Client? client;
  Product? product;
  int quantity = 0;
  double totalPrice = 0;
  int purchaseTime = 0;

  Purchase({
    required this.client,
    required this.product,
    required this.quantity,
    required this.totalPrice,
    required this.purchaseTime,
  });

  Purchase.fromMap(Map<String, dynamic> map) {
    client = Client.fromMap(map['client']);
    product = Product.fromMap(map['product']);
    quantity = map['quantity'];
    totalPrice = map['totalPrice'];
    purchaseTime = map['purchaseTime'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> m = {
      'client': client!.toMap(),
      'product': product!.toMap(),
      'quantity': quantity,
      'totalPrice': totalPrice,
      'purchaseTime': purchaseTime,
    };
    return m;
  }
}
