
import 'package:get/get.dart';

import '../ShoppingApp/binding/main_screen_binding.dart';
import '../ShoppingApp/binding/product_description_binding.dart';
import '../ShoppingApp/view/product_view.dart';
import '../ShoppingApp/view/login_screen.dart';
import '../ShoppingApp/view/main_screen.dart';
import '../ShoppingApp/view/product_details_page.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MainScreen;

  static final routes = [
    GetPage(
      name: _Paths.LoginScreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: _Paths.MainScreen,
      binding: MainScreenBinding(),
      page: () =>  const MainScreen(),
    ),
    GetPage(
      name: _Paths.Home,
      page: () =>  ProudtMainView(),
    ),
    GetPage(
      name: _Paths.ProductDetails,
      page: () => ProductsDetailsPage(),
      binding: ProductDetailsBinding()
    ),
  ];
}