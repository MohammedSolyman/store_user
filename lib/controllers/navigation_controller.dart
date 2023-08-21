import 'package:get/get.dart';
import 'package:store_user/controllers/purchase_controller.dart';
import 'package:store_user/data_types/category/category.dart';
import 'package:store_user/data_types/product/product.dart';
import 'package:store_user/pages/categories_page/components/show_category_products.dart';
import 'package:store_user/pages/main_gate/main_gate.dart';
import 'package:store_user/pages/product_details/product_details.dart';
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

  goToShowCategoryProducts(List<Product> dataList, Category category) {
    Get.to(() => ShowCategoryProducts(
          dataList: dataList,
          categorName: category.categoryName,
        ));
  }
}
