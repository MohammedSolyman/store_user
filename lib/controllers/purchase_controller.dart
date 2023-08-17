import 'package:get/get.dart';
import 'package:store_user/controllers/theme_controller.dart';
import 'package:store_user/models/purchase/purchase_data_model.dart';

class PurchaseController extends ThemeController {
  Rx<PurchaseDataModel> purchaseDataModel = PurchaseDataModel().obs;
}
