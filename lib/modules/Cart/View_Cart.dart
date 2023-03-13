import 'package:eazymen_customer/modules/Cart/Components/selectedEazyman.dart';
import 'package:eazymen_customer/modules/EazyPizy_Store/components/Product_Card2.dart';
import 'package:eazymen_customer/modules/EazymanProfile/components/ViewCart_Bottom_Navigation.dart';
import 'package:eazymen_customer/theme/app_colors.dart';
import 'package:eazymen_customer/theme/eazy_spaces.dart';
import 'package:eazymen_customer/widgets/easy_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../AnimatedContainer.dart';
import '../Apply_Coupans/ApplyCoupons.dart';
import '../Booking_Schedule/View_SelectService_Slot.dart';
import 'Components/PaymentSummary.dart';
import 'Components/service_In_Cart.dart';

class ViewCart extends StatelessWidget {
  const ViewCart({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItem = <String>['new'];

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Cart',
            style: Get.textTheme.headlineMedium,
          ),
          actions: const [],
        ),
        body: cartItem.isNotEmpty
            ? Stack(children: [
                SingleChildScrollView(
                  padding: Space.scaffoldPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //   const selectedEazyman(),
                      const ServiceInCart(),
                      SizedBox(
                        height: 8.h,
                      ),

                      const PaymentSummary(),
                      SizedBox(
                        height: 8.h,
                      ),
                      _applyCoupon(),
                      SizedBox(
                        height: 16.h,
                      ),
                      yourSavings(),
                    ],
                  ),
                ),
                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child: Container(
                //     height: 40,
                //     color: Colors.green,
                //     child: Padding(
                //       padding: const EdgeInsets.all(8),
                //       child: Row(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             'Your Earning',
                //             style: Get.textTheme.labelSmall,
                //           ),
                //           Text(
                //             'New Value',
                //             style: Get.textTheme.labelSmall,
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
              ])
            : Container(),
        bottomNavigationBar: ViewCartBottomNavigation(
          buttonWidget: customButtons(context),
        ));
  }
}

Widget customButtons(BuildContext context) {
  return Expanded(
      child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {
            _addDeliveryAddress(context);
          },
          child: Text('Add Address', style: Get.textTheme.labelSmall),
        ),
        IconButton(
          onPressed: () {
            enterMobileNumber(context);
          },
          icon: const Icon(Icons.chevron_right),
        )
      ],
    ),
  ));
}

Widget yourSavings() {
  return EasyContainer(
    elevation: 0,
    color: Colors.green,
    height: 50,
    child: Text('You are saving 50Rs', style: Get.textTheme.labelSmall),
  );
}

Widget _applyCoupon() {
  return EasyContainer(
    color: EazyColors.white,
    elevation: 1,
    child: ListTile(
      tileColor: EazyColors.white,
      onTap: () {
        Get.to(ApplyCoupons());
      },
      title: Text('Apply Coupon', style: Get.textTheme.labelSmall),
      subtitle: Text('Avail Offer and Discount on your Order',
          style: Get.textTheme.labelSmall),
      trailing: const Icon(Icons.navigate_next_outlined),
    ),
  );
}

Future<void> _addDeliveryAddress(BuildContext context) {
  TextEditingController houseNumberController = TextEditingController();
  return Get.bottomSheet(
    EasyContainer(
      borderRadius: 10,
      height: MediaQuery.of(context).size.height - 0.1,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextButton.icon(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(color: Colors.green),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            onPressed: () => {},
            icon: const Icon(
              Icons.location_on,
            ),
            label: Text(
              'Use Current Location',
              style: Get.textTheme.labelSmall,
            ),
          ),
          Form(
            child: TextField(
              controller: houseNumberController,
            ),
          ),
          TextButton(
              onPressed: () {},
              child: Text('Save Address', style: Get.textTheme.labelSmall)),
        ],
      ),
    ),
  );
}

Future<void> enterMobileNumber(BuildContext context) {
  return Get.bottomSheet(
    EasyContainer(
      borderRadius: 10,
      height: MediaQuery.of(context).size.height - 0.1,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 100),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent, width: 0.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: EazyColors.blackShade, width: 0.5),
                ),
                hintText: 'Mobile Number',
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                enterOTP(context);
              },
              child: Text('Send OTP', style: Get.textTheme.labelSmall))
        ],
      ),
    ),
  );
}

Future<void> enterOTP(BuildContext context) {
  return Get.bottomSheet(
    EasyContainer(
      borderRadius: 10,
      height: MediaQuery.of(context).size.height - 0.1,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 100),
          Pinput(
            // defaultPinTheme: defaultPinTheme,
            // focusedPinTheme: focusedPinTheme,
            // submittedPinTheme: submittedPinTheme,
            validator: (s) {
              return s == '2222' ? null : 'Pin is incorrect';
            },
            showCursor: true,
            onCompleted: (pin) => print(pin),
          ),
          ElevatedButton(
              onPressed: () {},
              child: Text('Verify OTP', style: Get.textTheme.labelSmall))
        ],
      ),
    ),
  );
}

Widget? buildPinPut() {
  return Pinput(
    onCompleted: (pin) => print(pin),
  );
}
