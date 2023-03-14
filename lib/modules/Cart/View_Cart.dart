import 'package:eazymen_customer/core/services/cart_service.dart';
import 'package:eazymen_customer/modules/Apply_Coupans/ApplyCoupons.dart';
import 'package:eazymen_customer/modules/Cart/Components/PaymentSummary.dart';
import 'package:eazymen_customer/modules/Cart/Components/service_In_Cart.dart';
import 'package:eazymen_customer/modules/EazymanProfile/components/ViewCart_Bottom_Navigation.dart';
import 'package:eazymen_customer/modules/SignUp_SignIn/ctrl_authentication.dart';
import 'package:eazymen_customer/theme/app_colors.dart';
import 'package:eazymen_customer/theme/eazy_spaces.dart';
import 'package:eazymen_customer/widgets/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

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
          ? Stack(
              children: [
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
              ],
            )
          : Container(),
      bottomNavigationBar: ViewCartBottomNavigation(
        buttonWidget: customButtons(context),
      ),
    );
  }
}

Widget customButtons(BuildContext context) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(8),
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
              // enterMobileNumber(context);
              CartService.instance.checkout();
            },
            icon: const Icon(Icons.chevron_right),
          )
        ],
      ),
    ),
  );
}

Widget yourSavings() {
  return EasyContainer(
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
        Get.to(const ApplyCoupons());
      },
      title: Text('Apply Coupon', style: Get.textTheme.labelSmall),
      subtitle: Text(
        'Avail Offer and Discount on your Order',
        style: Get.textTheme.labelSmall,
      ),
      trailing: const Icon(Icons.navigate_next_outlined),
    ),
  );
}

Future<void> _addDeliveryAddress(BuildContext context) {
  final houseNumberController = TextEditingController();
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
            child: Text('Save Address', style: Get.textTheme.labelSmall),
          ),
        ],
      ),
    ),
  );
}

Future<void> enterMobileNumber() {
  final controller = Get.put(AuthenticationController());
  return Get.bottomSheet(
    EasyContainer(
      borderRadius: 10,
      height: Get.size.height - 0.1,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: controller.mobileNumberController,
              decoration: const InputDecoration(
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
            onPressed: controller.sendOtp,
            child: Text('Send OTP', style: Get.textTheme.labelSmall),
          )
        ],
      ),
    ),
  );
}

Future<void> enterOTP() {
  final controller = Get.find<AuthenticationController>();
  return Get.bottomSheet(
    EasyContainer(
      borderRadius: 10,
      height: Get.size.height - 0.1,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 100),
          Pinput(
            // defaultPinTheme: defaultPinTheme,
            // focusedPinTheme: focusedPinTheme,
            // submittedPinTheme: submittedPinTheme,
            controller: controller.otpController,
            length: 6,
            validator: (s) {
              if ((s?.length ?? 0) < 6) {
                return 'Enter complete digits';
              }
              return null;
            },
            onCompleted: print,
          ),
          ElevatedButton(
            onPressed: controller.verifyOtp,
            child: Text('Verify OTP', style: Get.textTheme.labelSmall),
          )
        ],
      ),
    ),
  );
}

Widget? buildPinPut() {
  return const Pinput(
    onCompleted: print,
  );
}
