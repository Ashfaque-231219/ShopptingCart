import 'package:get/get.dart';

import '../../model/product_list_model.dart';
import '../../service/api_service.dart';



class ProductController extends GetxController {
  final ApiService _apiService = ApiService();
  List<ProductList> products = [];
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    isLoading = true;
    update(); // Notifies GetX to refresh the UI
    try {
      products = await _apiService.fetchProducts();
    } catch (e) {
      Get.snackbar('Error', 'Could not fetch products');
    } finally {
      isLoading = false;
      update(); // Notifies GetX to refresh the UI
    }
  }
}
