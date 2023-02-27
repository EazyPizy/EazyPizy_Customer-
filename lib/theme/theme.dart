import 'package:eazymen_customer/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme = ThemeData(
  primaryColor: EazyColors.primary,
  fontFamily: GoogleFonts.signika().fontFamily,
  textTheme: TextTheme(
    headline6: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
    headline1: TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
    ),
    bodyText1: const TextStyle(
      color: EazyColors.black,
    ),
  ),
);
