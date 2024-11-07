import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/product_list_model.dart';
import 'cart_controller.dart';

class ProductDetailsController extends GetxController {
  final ProductList product;

  // Track the selected tab (0 for Description, 1 for Specification)
  Rx<int> selectedTab = 0.obs;

  // Track the current index of the product images
  int currentIndex = 0;

  // Cart controller
  final CartController cartController = Get.find<CartController>();

  ProductDetailsController({
    required this.product,
  });

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Update the selected tab when Description or Specification is tapped
  void onTabChanged(int index) {
    selectedTab.value = index;
  }

  // Update the image index when the page is changed
  void onPageChanged(int index) {
    currentIndex = index;
  }

  // Handle adding the product to the cart
  void addToCart() {
    cartController.addToCart(product);
    Get.snackbar(
      "Success",
      "${product.title} added to cart",
      snackPosition: SnackPosition.BOTTOM, // Show at the bottom of the screen
      backgroundColor: Colors.green, // Change color as needed
      colorText: Colors.white, // Text color
      icon: Icon(Icons.check, color: Colors.white),
    );

    // Close the bottom sheet
  }
}
