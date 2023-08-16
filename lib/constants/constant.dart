import 'package:store_user/controllers/my_controller.dart';

MyController myController = MyController.instance;

class Images {
  static final List<String> images =
      List.generate(10, (int index) => 'assets/stores/store$index.jpeg');
}
