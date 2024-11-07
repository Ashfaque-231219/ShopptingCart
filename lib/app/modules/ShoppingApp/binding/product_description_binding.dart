import 'package:get/get.dart';

import '../controller/product_details_controller.dart';

class ProductDetailsBinding extends Bindings {
  @override
  void dependencies() {
    final {
    'product': product,

    } = Get.arguments;

    Get.lazyPut<ProductDetailsController>(
          () => ProductDetailsController(
        product: product,

      ),
    );
  }
}
