import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/cart_controller.dart';

class CartPage extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Your Cart'),
        ),
        body: Obx(() {
          if (cartController.cartItems.isEmpty) {
            return const Center(
              child: Text('Your cart is empty', style: TextStyle(fontSize: 20)),
            );
          }

          return ListView.builder(
            itemCount: cartController.cartItems.length,
            itemBuilder: (context, index) {
              final product = cartController.cartItems[index];

              return Card(
                margin: EdgeInsets.all(10),
                elevation: 5,
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  title: Text(product.title ?? ''),
                  subtitle: Text('\$${product.price}'),
                  leading: Image.network(product.category?.image ?? ''),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_shopping_cart),
                    onPressed: () {
                      cartController.removeFromCart(product);
                    },
                  ),
                ),
              );
            },
          );
        }),
        bottomNavigationBar: Obx(() {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: \$${cartController.totalPrice}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle checkout logic
                  },
                  style: ElevatedButton.styleFrom(
                  ),
                  child: Text('Checkout'),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
