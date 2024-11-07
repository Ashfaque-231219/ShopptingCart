import 'package:flutter/material.dart';

class NavigationController {
  int selectedIndex = 0;
  PageController pageController = PageController();

  void onItemTapped(int index, Function callback) {
    selectedIndex = index;
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    callback();
  }

  void dispose() {
    pageController.dispose();
  }
}
