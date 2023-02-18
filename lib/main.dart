import 'package:eazymen_customer/core/pages.dart';
import 'package:eazymen_customer/modules/navigation/view_navigation.dart';
import 'package:eazymen_customer/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
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
