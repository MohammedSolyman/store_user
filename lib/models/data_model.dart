import 'package:store_user/data_types/product.dart';

class DataModel {
  List<Product> allProducts = [];
  List<Product> onSaleProducts = [];
  List<Product> latestProducts = [];

// products which appear in the home page (4 products only in each
// category.)
  List<Product> onSaleProductsShort = [];
  List<Product> latestProductsShort = [];

  Set<Product> wishList = {};
}
