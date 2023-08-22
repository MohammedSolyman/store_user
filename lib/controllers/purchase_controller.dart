import 'package:get/get.dart';
import 'package:store_user/controllers/theme_controller.dart';
import 'package:store_user/data_types/purchase.dart';
import 'package:store_user/models/purchase_model.dart';

class PurchaseController extends ThemeController {
  Rx<PurchaseModel> purchaseModel = PurchaseModel().obs;

  addToPurchaseList(Purchase purchase) {
    purchaseModel.update((val) {
      val!.myPurchases.add(purchase);
    });
  }
}
