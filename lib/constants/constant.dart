import 'package:store_user/controllers/my_controller.dart';

MyController myController = MyController.instance;

class Images {
  static final List<String> images =
      List.generate(10, (int index) => 'assets/stores/store$index.jpeg');
}

class Unit {
  static const String kilo = "kilo";
  static const String piece = "piece";
}

class Category {
  static const String grains = "grains";
  static const String fruits = "fruits";
  static const String vegetables = "vegetables";
  static const String dairy = "dairy";

  static const List<String> categoryList = [
    Category.dairy,
    Category.fruits,
    Category.vegetables,
    Category.grains
  ];
}
