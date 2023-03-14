import 'package:eazymen_customer/core/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<GetPage> pages = [
  GetPage(
    name: Routes.home,
    page: SizedBox.new,
  ),
  GetPage(
    name: Routes.checkout,
    page: () => const Scaffold(
      body: Center(
        child: Text('Checkout'),
      ),
    ),
  ),
];

//  GetPage(
//     name: _viewsMap[Routes.homeNavigation]!,
//     page: () => const HomeNavigation(),
//     binding: BindingsBuilder(() {
//       Get.lazyPut<HomeController>(HomeController.new);
//     }),
//   ),