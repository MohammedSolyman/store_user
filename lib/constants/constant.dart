import 'package:store_user/controllers/my_controller.dart';
import 'package:store_user/models/category/category.dart';

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
  static final CategoryModel _grains = CategoryModel('grains', 'assets/store.png');
  static final CategoryModel _fruits = CategoryModel('fruits', 'assets/store.png');
  static final CategoryModel _dairy = CategoryModel('dairy', 'assets/store.png');
  static final CategoryModel _vegetables =
      CategoryModel('vegetables', 'assets/store.png');

  static List<CategoryModel> categoryList = [
    _dairy,
    _fruits,
    _vegetables,
    _grains
  ];
}
