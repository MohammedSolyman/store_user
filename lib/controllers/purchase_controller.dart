import 'package:get/get.dart';
import 'package:store_user/controllers/theme_controller.dart';
import 'package:store_user/data_types/purchase.dart';
import 'package:store_user/models/purchase_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PurchaseController extends ThemeController {
  Rx<PurchaseModel> purchaseModel = PurchaseModel().obs;

  addToPurchaseList(Purchase purchase) {
    purchaseModel.update((val) {
      val!.myPurchases.add(purchase);
    });
  }

  buy() async {
    CollectionReference<Map<String, dynamic>> colRef =
        FirebaseFirestore.instance.collection('orders');
    purchaseModel.value.myPurchases.forEach((element) {
      colRef.add(element.toMap());
    });

    await getAllOrders();
  }

  getAllOrders() async {
    CollectionReference<Map<String, dynamic>> colRef =
        FirebaseFirestore.instance.collection('orders');
    QuerySnapshot<Map<String, dynamic>> querySS = await colRef.get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> mylist = querySS.docs;
    List<Purchase> x = [];

    mylist.forEach((QueryDocumentSnapshot<Map<String, dynamic>> element) {
      Map<String, dynamic> m = element.data();
      Purchase p = Purchase.fromMap(m);
      x.add(p);
    });

    purchaseModel.update((val) {
      val!.myOrders = x;
    });
    print('lllllllllllllllllllllllllllllllllllllll');
    print('lllllllllllllllllllllllllllllllllllllll');
    print(purchaseModel.value.myOrders.length);
  }
}
