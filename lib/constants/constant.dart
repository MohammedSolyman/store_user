import 'package:store_user/controllers/my_controller.dart';
import 'package:store_user/data_types/category/category.dart';

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
  static final Category _grains = Category('grains', 'assets/store.png');
  static final Category _fruits = Category('fruits', 'assets/store.png');
  static final Category _dairy = Category('dairy', 'assets/store.png');
  static final Category _vegetables =
      Category('vegetables', 'assets/store.png');

  static List<Category> categoryList = [_dairy, _fruits, _vegetables, _grains];
}
