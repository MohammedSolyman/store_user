import 'package:get/get.dart';
import 'package:store_user/controllers/purchase_controller.dart';
import 'package:store_user/data_types/category/category.dart';
import 'package:store_user/data_types/product/product.dart';
import 'package:store_user/global_widgets/products/products_grid.dart';
import 'package:store_user/pages/main_gate/main_gate.dart';
import 'package:store_user/pages/product_details/product_details.dart';
import 'package:store_user/pages/products_page/products_page.dart';
import 'package:store_user/pages/sign_in_page/sign_in_page.dart';
import 'package:store_user/pages/sign_up_page/sign_up_page.dart';

class NavigationController extends PurchaseController {
  goToProductTetails(Product product) {
    Get.to(ProductDetails(product: product));
  }

  goToSignIn() {
    Get.to(const SignInPage());
  }

  goToSignUp() {
    Get.to(() => const SignUpPage());
  }

  goToCartPage() {
    Get.to(() => const MainGate(index: 2));
  }

  goToProductsPage(List<Product> dataList, Category category) {
    Get.to(() => ProductsPage(
          dataList: dataList,
          title: category.categoryName,
        ));
  }
}
