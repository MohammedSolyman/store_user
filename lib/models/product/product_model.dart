import 'package:store_user/constants/constant.dart';

class ProductModel {
  String productName = "";
  int productPrice = 0;
  String productUnit = Unit.kilo;
  String productCategory = Category.grains;
  bool isOnSale = false;
  String productImage = "";
  int createdOn = 0;
  int lastModifiedOn = 0;

  ProductModel(
      {required this.productName,
      required this.productPrice,
      required this.productUnit,
      required this.productCategory,
      required this.isOnSale,
      required this.productImage,
      required this.createdOn,
      required this.lastModifiedOn});

  ProductModel.fromMap(Map<String, dynamic> myMap) {
    productName = myMap['productName'];
    productPrice = myMap['productPrice'];
    productUnit = myMap['productUnit'];
    productCategory = myMap['productCategory'];
    isOnSale = myMap['isOnSale'];
    productImage = myMap['productImage'];
    createdOn = myMap['createdOn'];
    lastModifiedOn = myMap['lastModifiedOn'];
  }

  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'productPrice': productPrice,
      'productUnit': productUnit,
      'productCategory': productCategory,
      'isOnSale': isOnSale,
      'productImage': productImage,
      'createdOn': createdOn,
      'lastModifiedOn': lastModifiedOn
    };
  }
}