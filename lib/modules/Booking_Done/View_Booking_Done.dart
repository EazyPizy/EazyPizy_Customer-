import 'package:eazymen_customer/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class ViewBookingDone extends StatelessWidget {
  const ViewBookingDone({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: EazyColors.background,
      body: Center(
        child: Text('Booking Done',
          style: Get.textTheme.titleMedium,

          // GoogleFonts.signika(
          //   fontSize: 20,
          //  color: EazyColors.dummy,
          //  // fontWeight: FontWeight.bold
          // )
          // ,
        ),
      ),
    );
  }
}
