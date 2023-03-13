import 'package:eazymen_customer/theme/app_colors.dart';
import 'package:eazymen_customer/theme/eazy_spaces.dart';
import 'package:eazymen_customer/widgets/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplyCoupons extends StatelessWidget {
  const ApplyCoupons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Coupons and Offers',
          style: Get.textTheme.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        padding: Space.scaffoldPadding,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: ' Enter Coupon',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            EasyContainer(
              borderRadius: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                     // color: Colors.red,
                      height: 40,
                      width: 75,
                      child: Image.asset('assets/EazymenLogo.png'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        ' FIRST500',
                      ),
                      TextButton(
                        onPressed: () {
                          Get..back()
                          ..snackbar('Coupon applied', '499Rs off applied',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.green,
                            borderRadius: 10,
                          );
                        },
                        child: const Text('APPLY'),
                      ),
                    ],
                  ),
                  Text(
                    'Flat 10% off on PayTm Wallet',
                    style: Get.textTheme.titleMedium,
                  ),
                  Text(
                    'Applicable on 7999 and above cart Value',
                    style: Get.textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
