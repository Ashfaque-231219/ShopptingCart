import 'package:get/get.dart';

import '../controller/product_controller.dart';

class MainScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(
          () => ProductController(),
    );

  }
}