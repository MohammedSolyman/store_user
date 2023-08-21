import 'package:get/get.dart';
import 'package:store_user/controllers/scrolling_images_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store_user/data_types/category/category.dart';
import 'package:store_user/data_types/product/product.dart';
import 'package:store_user/models/products_model.dart';

class ProductsController extends ScrollingImagesController {
  Rx<ProductsModel> productsModel = ProductsModel().obs;

  getAllProducts() async {
    FirebaseFirestore instance = FirebaseFirestore.instance;
    CollectionReference<Map<String, dynamic>> colRef =
        instance.collection('products');

    QuerySnapshot<Map<String, dynamic>> querySS = await colRef.get();

    List<QueryDocumentSnapshot<Map<String, dynamic>>> myList = querySS.docs;
    List<Product> x = [];

    for (var element in myList) {
      Map<String, dynamic> myMap = element.data();
      Product myProduct = Product.fromMap(myMap);
      x.add(myProduct);
    }

    productsModel.update((val) {
      val!.allProducts = x;

      val.onSaleProducts = x;
      val.latestProducts = x;
      val.latestProducts = val.latestProducts.sublist(0, 2);
    });
  }

  List<Product> getCategoryProducts(Category category) {
    List<Product> newList = productsModel.value.allProducts.where((product) {
      return product.productCategory == category.categoryName;
    }).toList();

    return newList;
  }
}
