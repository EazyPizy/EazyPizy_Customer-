import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../theme/app_colors.dart';
import 'package:eazymen_customer/widgets/easy_container.dart';

class EazymanServiceCard extends StatelessWidget {
  const EazymanServiceCard({super.key});

  // final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        EasyContainer(
          elevation: 0.5,
          height: 150,
          // width: double.infinity,
          // customPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          //  borderRadius: 16.r,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8, top: 8, right: 8, bottom: 2),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    // crossAxisAlignment: CrossAxisAlignment.end,

                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black54,
                            width: 1,
                          ),
                        ),
                        height: 60,
                        width: 60,
                        child: Image.network(
                            'https://firebasestorage.googleapis.com/v0/b/eazyman-2e7a7.appspot.com/o/User_images%2FEazyMan.png?alt=media&token=a376abde-5072-4d49-b25d-a7b059f4fb29'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Container(
                          width: 75,
                          color: Colors.green.withOpacity(0.5),
                          child: Center(
                            child: Text(
                              'Earn',
                              style: Get.textTheme.labelSmall,
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'serviceName',
                        style: Get.textTheme.labelLarge,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: EasyContainer(
                              elevation: 0.5,
                              padding: 5,
                              // height: 20.h,
                              color: EazyColors.dummy,
                              child: Text(
                                'AC Technician ',
                                style: Get.textTheme.labelSmall,
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('ADD', style: Get.textTheme.labelSmall),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}
