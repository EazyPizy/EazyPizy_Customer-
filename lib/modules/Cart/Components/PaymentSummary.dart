import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/eazy_spaces.dart';

class PaymentSummary extends StatelessWidget {
  const PaymentSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
           Text('Payment Summary',style: Get.textTheme.titleMedium),
          SizedBox(height: 8,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Item Totals', style: Get.textTheme.titleMedium),
              Text('499', style: Get.textTheme.titleMedium),
            ],
          ),
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Taxes', style: Get.textTheme.titleMedium),
                Text('49', style: Get.textTheme.titleMedium),
              ]),
          const SizedBox(
            height: 30,
          ),
          Divider(),
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Grand Totals', style: Get.textTheme.titleLarge),
                Text('499', style: Get.textTheme.titleLarge),
              ]),
        ]));
  }
}
