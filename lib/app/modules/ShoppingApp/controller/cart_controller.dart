import 'package:get/get.dart';

import '../../model/product_list_model.dart';


class CartController extends GetxController {
  // List of products in the cart
  var cartItems = <ProductList>[].obs;

  // Method to add a product to the cart
  void addToCart(ProductList product) {
    // Check if the product is already in the cart
    if (!cartItems.contains(product)) {
      cartItems.add(product);
    }
  }

  // Method to remove a product from the cart
  void removeFromCart(ProductList product) {
    cartItems.remove(product);
  }

  // Method to get the total price of the cart
  double get totalPrice {
    double total = 0;
    for (var item in cartItems) {
      total += item.price ?? 0;
    }
    return total;
  }
}
