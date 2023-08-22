import 'package:get/get.dart';
import 'package:store_user/controllers/scrolling_images_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store_user/data_types/category.dart';
import 'package:store_user/data_types/product.dart';
import 'package:store_user/models/data_model.dart';

class DataController extends ScrollingImagesController {
  Rx<DataModel> dataModel = DataModel().obs;

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

    dataModel.update((val) {
      val!.allProducts = x;

      val.onSaleProducts = x;
      val.latestProducts = x;
      val.latestProducts = val.latestProducts.sublist(0, 2);
    });
  }

  List<Product> getCategoryProducts(Category category) {
    List<Product> newList = dataModel.value.allProducts.where((product) {
      return product.productCategory == category.categoryName;
    }).toList();

    return newList;
  }

  List<Product> getSaleProducts() {
    List<Product> newList = dataModel.value.allProducts.where((product) {
      return product.isOnSale == true;
    }).toList();

    return newList;
  }

  void _makeProductLiked(int index) {
    dataModel.update((val) {
      val!.allProducts[index].isLiked = true;
    });
  }

  void _makeProductUnliked(int index) {
    dataModel.update((val) {
      val!.allProducts[index].isLiked = false;
    });
  }

  void _addToWishList(Product product) {
    dataModel.update((val) {
      val!.wishList.add(product);
    });
  }

  void _removeFromWishList(Product product) {
    dataModel.update((val) {
      val!.wishList.removeWhere((element) {
        return element.productName == product.productName;
      });
    });
  }

  int getProductIndex(Product product) {
    //returns the index of this product in allProduct list.
    String name = product.productName;
    int index = dataModel.value.allProducts.indexWhere((element) {
      return element.productName == name;
    });
    return index;
  }

  void favoriteFunc(Product product) {
    int index = getProductIndex(product);

    if (dataModel.value.allProducts[index].isLiked) {
      _makeProductUnliked(index);
      _removeFromWishList(product);
    } else {
      _makeProductLiked(index);
      _addToWishList(product);
    }
  }
}
