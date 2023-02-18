import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class Space {
  static EdgeInsets scaffoldPadding = EdgeInsets.symmetric(horizontal: 18.w);

  static SizedBox vertical(double value) => SizedBox(
        height: value,
      );

  static SizedBox horizontal(double value) => SizedBox(
        width: value,
      );
}
