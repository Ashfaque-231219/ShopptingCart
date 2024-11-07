part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const BikesHomePage = _Paths.Home;

  static const MainScreen = _Paths.MainScreen;
  static const ProductDetails = _Paths.ProductDetails;
  static const LoginScreen = _Paths.LoginScreen;




}

abstract class _Paths {
  _Paths._();

  static const Home = '/homePage';

  static const MainScreen = '/mainscreen';
  static const ProductDetails = '/product_details';
  static const LoginScreen = '/login';  // New path for the login screen




}