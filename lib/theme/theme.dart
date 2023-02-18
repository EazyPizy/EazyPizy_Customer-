import 'package:eazymen_customer/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData theme = ThemeData(
  primaryColor: EazyColors.primary,
  textTheme: TextTheme(
    headline6: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
    bodyText1: const TextStyle(
      color: EazyColors.black,
    ),
  ),
);
