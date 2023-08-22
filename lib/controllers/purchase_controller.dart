import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:store_user/controllers/theme_controller.dart';
import 'package:store_user/data_types/purchase.dart';
import 'package:store_user/models/purchase_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store_user/pages/orders_page/orders_page.dart';

class PurchaseController extends ThemeController {
  Rx<PurchaseModel> purchaseModel = PurchaseModel().obs;

  Future<void> buy() async {
    // send this purchase list to firebase store
    CollectionReference<Map<String, dynamic>> colRef =
        FirebaseFirestore.instance.collection('orders');
    purchaseModel.value.myPurchases.forEach((element) {
      colRef.add(element.toMap());
    });

    // clear purchase list
    purchaseModel.update((val) {
      val!.myPurchases = [];
    });

    // refresh myOrders list
    //await getAllOrders();

    // go to orders page
    Get.off(() => const OrdersPage());
  }

  getAllOrders() async {
    // fetch myOrders from firestore for this user only if there is a user already
    if (FirebaseAuth.instance.currentUser != null) {
      String uId = FirebaseAuth.instance.currentUser!.uid;

      CollectionReference<Map<String, dynamic>> colRef =
          FirebaseFirestore.instance.collection('orders');

      Query<Map<String, dynamic>> q = colRef.where('userId', isEqualTo: uId);

      QuerySnapshot<Map<String, dynamic>> querySS = await q.get();
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
    }
  }
}
