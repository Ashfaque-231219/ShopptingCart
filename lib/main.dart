import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/modules/routes/app_pages.dart';  // Import the package

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // Ensures Flutter is fully initialized
  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),  // Define the design size (width, height)
      minTextAdapt: true,  // Adjust text scaling if needed
      splitScreenMode: true,  // Optionally use split-screen mode
      builder: (context, child) {
        return MyApp();  // Wrap your app with ScreenUtilInit
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,  // Ensure the login screen is the initial route
      getPages: AppPages.routes,
    );
  }
}
