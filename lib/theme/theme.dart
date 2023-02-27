import 'package:eazymen_customer/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData theme = ThemeData(
  primaryColor: EazyColors.primary,
  appBarTheme: const AppBarTheme(
    backgroundColor: EazyColors.appBarBG,
    iconTheme: IconThemeData(
      color: EazyColors.lightBlack,
    ),
  ),
  textTheme: TextTheme(
    titleSmall: TextStyle(
      fontFamily: 'Signika',
      fontWeight: FontWeight.normal,
      fontSize: 12.sp,
      color: EazyColors.lightBlack,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Signika',
      fontWeight: FontWeight.normal,
      fontSize: 14.sp,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Signika',
      fontWeight: FontWeight.normal,
      fontSize: 18.sp,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'Signika',
      fontWeight: FontWeight.w100,
      fontSize: 10.sp,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Signika',
      fontWeight: FontWeight.normal,
      fontSize: 20.sp,
      color: EazyColors.black,
    ),
    headlineLarge: TextStyle(
      fontFamily: 'Signika',
      fontWeight: FontWeight.normal,
      fontSize: 40.sp,
      color: Colors.green,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Signika',
      fontWeight: FontWeight.bold,
      fontSize: 10.sp,
      color: EazyColors.white,
    ),
  ),
  iconTheme: const IconThemeData(color: EazyColors.black),
);
