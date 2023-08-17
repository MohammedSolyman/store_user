import 'package:get/get.dart';
import 'package:store_user/controllers/scrolling_images_controller.dart';
import 'package:store_user/models/category/category.dart';
import 'package:store_user/models/product/product_model.dart';
import 'package:store_user/models/product/products_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsController extends ScrollingImagesController {
  Rx<ProductsDataModel> productsDataModel = ProductsDataModel().obs;
  Rx<CategoriesModel> categoriesModel = CategoriesModel().obs;

  _getAllProducts() async {
    FirebaseFirestore instance = FirebaseFirestore.instance;
    CollectionReference<Map<String, dynamic>> colRef =
        instance.collection('products');
    QuerySnapshot<Map<String, dynamic>> querySS = await colRef.get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> myList = querySS.docs;
    List<ProductModel> x = [];

    for (var element in myList) {
      Map<String, dynamic> myMap = element.data();
      ProductModel myProduct = ProductModel.fromMap(myMap);
      x.add(myProduct);
    }

    productsDataModel.update((val) {
      val!.allProducts = x;

      val.onSaleProducts = x;
      val.latestProducts = x;
      val.latestProducts = val.latestProducts.sublist(0, 2);
    });
  }

  @override
  void onInit() async {
    super.onInit();
    await _getAllProducts();
    print('---------------------');
    for (var element in productsDataModel.value.allProducts) {
      print(element.productName);
    }
  }
}
