import 'package:eazymen_customer/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme = ThemeData(
  primaryColor: EazyColors.primary,
  textTheme: const TextTheme(
    titleSmall: TextStyle(
        fontFamily: 'Signika', fontWeight: FontWeight.normal, fontSize: 12, color: EazyColors.lightBlack),
    titleMedium: TextStyle(
        fontFamily: 'Signika', fontWeight: FontWeight.normal, fontSize: 14),
    titleLarge: TextStyle(
        fontFamily: 'Signika', fontWeight: FontWeight.normal, fontSize: 18),

    headlineSmall: TextStyle(
        fontFamily: 'Signika', fontWeight: FontWeight.w100, fontSize: 10),
    headlineMedium: TextStyle(
        fontFamily: 'Signika',
        fontWeight: FontWeight.normal,
        fontSize: 20,
        color: EazyColors.black),
    headlineLarge: TextStyle(
        fontFamily: 'Signika',
        fontWeight: FontWeight.normal,
        fontSize: 40,
        color: Colors.green),

    bodySmall: TextStyle(
        fontFamily: 'Signika', fontWeight: FontWeight.bold, fontSize: 10, color: EazyColors.white),

  ),
  iconTheme: const IconThemeData(color: EazyColors.black),
);
