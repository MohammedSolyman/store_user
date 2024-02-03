import 'package:store_user/controllers/my_controller.dart';
import 'package:store_user/data_types/category.dart';

MyController myController = MyController.instance;

//scrolling images
class Images {
  static final List<String> images =
      List.generate(10, (int index) => 'assets/stores/store$index.jpeg');
}

//Measurement images
class Unit {
  static const String kilo = "kilo";
  static const String piece = "piece";
}

//categories data
class MyCategories {
  static final Category bakery = Category('Bakery', 'assets/store.png');
  static final Category beverages = Category('Beverages', 'assets/store.png');
  static final Category cannedGoods =
      Category('Canned Goods', 'assets/store.png');
  static final Category cleaners = Category('Cleaners', 'assets/store.png');
  static final Category dairy = Category('Dairy', 'assets/store.png');
  static final Category dryGoods = Category('Dry Goods', 'assets/store.png');
  static final Category frozen = Category('Frozen', 'assets/store.png');
  static final Category fruits = Category('Fruits', 'assets/store.png');
  static final Category grains = Category('Grains', 'assets/store.png');
  static final Category meat = Category('Meat', 'assets/store.png');
  static final Category paperGoods =
      Category('Paper Goods', 'assets/store.png');
  static final Category personalCare =
      Category('Personal Care', 'assets/store.png');
  static final Category vegetables = Category('Vegetables', 'assets/store.png');
  static final Category other = Category('Other', 'assets/store.png');

  static List<Category> categoryList = [
    bakery,
    beverages,
    cannedGoods,
    cleaners,
    dairy,
    dryGoods,
    frozen,
    fruits,
    grains,
    meat,
    paperGoods,
    personalCare,
    vegetables,
    other,
  ];
}
