import 'package:store_user/data_types/product.dart';

class DataModel {
  List<Product> allProducts = [];
  List<Product> onSaleProducts = [];
  List<Product> latestProducts = [];
  List<Product> history = [];

  Set<Product> wishList = {};
}
