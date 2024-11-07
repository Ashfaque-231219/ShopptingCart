import 'package:demo/app/modules/ShoppingApp/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/cart_controller.dart';
import '../controller/navigate_controller.dart';
import 'product_view.dart';
import 'cart_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final NavigationController _navController = NavigationController();

  @override
  void dispose() {
    _navController.dispose();
    super.dispose();
  }
@override
  void initState() {
    Get.put(CartController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF282A36),
      body: PageView(
        controller: _navController.pageController,
        onPageChanged: (index) {
          setState(() {
            _navController.selectedIndex = index;
          });
        },
        children: [
          ProudtMainView(),
          CartPage(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF3C415C),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        currentIndex: _navController.selectedIndex,
        onTap: (index) => _navController.onItemTapped(index, () => setState(() {})),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.directions_bike), label: 'Bikes'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
