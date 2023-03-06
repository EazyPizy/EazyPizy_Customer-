import 'package:eazymen_customer/theme/eazy_spaces.dart';
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: EasyContainer(
            elevation: 0.5,
            height: 250,
            color: Colors.white,
            // width: double.infinity,

            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const EazymanProfile()),
              // );
            },
            // customPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            //  borderRadius: 16.r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,


                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.blueAccent.withOpacity(0.50),
                          ),
                        ),
                        height: 75,
                        width: 75,
                        child: Image.network(
                            'https://firebasestorage.googleapis.com/v0/b/eazyman-2e7a7.appspot.com/o/User_images%2FEazyMan.png?alt=media&token=a376abde-5072-4d49-b25d-a7b059f4fb29'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4, left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Window AC',
                                style: Get.textTheme.titleLarge,
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              ),

                              Text('499', style: Get.textTheme.titleLarge,
                                softWrap: true,
                                overflow: TextOverflow.fade,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 4.0),
                                child: Text(
                                  'AC Technician ',
                                  style: Get.textTheme.titleSmall,
                                  softWrap: true,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  'Electrician',
                                  style: Get.textTheme.titleSmall,
                                  softWrap: true,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Row(
                                  children: [
                                    const Icon(
                                      size: 20,
                                      Icons.star,
                                      color: Colors.blueAccent,
                                    ),
                                    Text(
                                      '4.5',
                                      style: Get.textTheme.titleMedium,
                                      softWrap: true,
                                      overflow: TextOverflow.fade,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Row(
                                  children: [
                                    const Icon(
                                      size: 20,
                                      Icons.credit_card,
                                      color: Colors.blueAccent,
                                    ),
                                    Text(
                                      '350 Jobs ',
                                      style: Get.textTheme.titleMedium,
                                      softWrap: true,
                                      overflow: TextOverflow.fade,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                   // Spacer(),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.end,
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     children: [
                    //     //  Text('499'),
                    //      // Text('499'),
                    //       OutlinedButton(
                    //
                    //         onPressed: () {},
                    //         child: Text(
                    //           'ADD',
                    //           style: Get.textTheme.labelSmall,
                    //         ),
                    //       )
                    //   ],
                    //   ),
                    // )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey.withOpacity(0.5),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Icon(
                        Icons.circle,
                        size: 10,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        'Jet-Pump AC Service of AC Filter,',
                        style: Get.textTheme.titleSmall,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Icon(
                        Icons.circle,
                        size: 10,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        'Jet-Pump AC Service of AC Filter, Indoor and Out door',
                        style: Get.textTheme.titleSmall,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Icon(
                        Icons.circle,
                        size: 10,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        'Jet-Pump AC Service of AC Filter, Indoor and Out door',
                        style: Get.textTheme.titleSmall,
                      ),
                    )
                  ],
                ),
                // ElevatedButton(
                //   onPressed: () {},
                //   child: Text(
                //     'Book ME',
                //     style: Get.textTheme.labelSmall,
                //   ),
                // )
              ],
            ),
          ),
        ),
        // Align(
        //   alignment: Alignment.centerRight,
        //   child: Card(
        //       margin: const EdgeInsets.only(right: 25, top: 85),
        //       elevation: 0,
        //       child: ElevatedButton(
        //         onPressed: () {},
        //         child: Text(
        //           'Book ME',
        //           style: Get.textTheme.labelSmall,
        //         ),
        //       )),
        // ),
      ],
    );
  }
}
