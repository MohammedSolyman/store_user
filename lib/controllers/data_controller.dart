import 'package:get/get.dart';
import 'package:store_user/controllers/scrolling_images_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store_user/data_types/category.dart';
import 'package:store_user/data_types/product.dart';
import 'package:store_user/models/data_model.dart';

class DataController extends ScrollingImagesController {
  Rx<DataModel> dataModel = DataModel().obs;

  Future<void> _fetchProducts() async {
    // fetching and updating all products
    FirebaseFirestore instance = FirebaseFirestore.instance;
    CollectionReference<Map<String, dynamic>> colRef =
        instance.collection('products');

    QuerySnapshot<Map<String, dynamic>> querySS = await colRef.get();

    List<QueryDocumentSnapshot<Map<String, dynamic>>> myList = querySS.docs;
    List<Product> allProducts = [];

    for (var element in myList) {
      Map<String, dynamic> myMap = element.data();
      Product myProduct = Product.fromMap(myMap);
      allProducts.add(myProduct);
    }
    dataModel.update((val) {
      val!.allProducts = allProducts;
    });
  }

  void _updateOnSaleProducts() {
    // 1. Extracting on sale products list.
    List<Product> onSaleProducts = dataModel.value.allProducts.where((product) {
      return product.isOnSale == true;
    }).toList();

    // 2. Extracting on sale products short list (up to 4 products only).
    List<Product> onSaleProductsShort = onSaleProducts;

    if (onSaleProductsShort.length >= 5) {
      onSaleProductsShort = onSaleProductsShort.sublist(0, 4);
    }

    dataModel.update((val) {
      val!.onSaleProducts = onSaleProducts;
      val.onSaleProductsShort = onSaleProductsShort;
    });
  }

  void _updateLatestProducts() {
    //1. Extracting latest products (up to 10 products)
    List<Product> latestProducts = dataModel.value.allProducts;

    latestProducts.sort(
      (a, b) {
        return a.createdOn.compareTo(b.createdOn);
      },
    );

    if (latestProducts.length >= 11) {
      latestProducts = latestProducts.sublist(0, 10);
    }

    //2. Extracting latest products (shortlist) (up to 4 products)
    List<Product> latestProductsShort = latestProducts;

    if (latestProductsShort.length >= 5) {
      latestProductsShort = latestProductsShort.sublist(0, 4);
    }
    dataModel.update((val) {
      val!.latestProducts = latestProducts;
      val.latestProductsShort = latestProductsShort;
    });
  }

  Future<void> getAllProducts() async {
    await _fetchProducts();
    _updateOnSaleProducts();
    _updateLatestProducts();
  }

  List<Product> getCategoryProducts(Category category) {
    List<Product> newList = dataModel.value.allProducts.where((product) {
      return product.productCategory == category.categoryName;
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
