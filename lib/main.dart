import 'package:eazymen_customer/core/pages.dart';
import 'package:eazymen_customer/core/services/cart_service.dart';
import 'package:eazymen_customer/core/services/category_services.dart';
import 'package:eazymen_customer/modules/navigation/view_navigation.dart';
import 'package:eazymen_customer/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      statusBarColor: Colors.white, // navigation bar color
      // status bar color
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Get.putAsync(() => CategoryService().init());
  Get.put(CartService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 739),
      builder: (context, child) => GetMaterialApp(
        title: 'Flutter Demo',
        theme: theme,
        home: const NavigationView(),
        getPages: pages,
      ),
    );
  }
}
