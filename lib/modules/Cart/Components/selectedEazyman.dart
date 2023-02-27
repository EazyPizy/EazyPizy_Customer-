import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../widgets/easy_container.dart';
import 'package:get/get.dart';

class selectedEazyman extends StatelessWidget {
  const selectedEazyman();

  // final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        EasyContainer(
          elevation: 0.5,
          height: 120,
          child: Column(
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8, top: 8, right: 8, bottom: 2),
                  child: Column(
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
                          child:  Center(
                            child: Text(
                              'Earn',
                              style: Get.textTheme.labelSmall
                              ,
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
                        'productName',
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
              ]),
            ],
          ),
        ),
      ],
    );
  }
}
