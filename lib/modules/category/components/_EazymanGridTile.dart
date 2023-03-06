import 'package:eazymen_customer/modules/EazymanProfile/View_EazymanProfile.dart';
import 'package:eazymen_customer/modules/home/models/model_home.dart';
import 'package:eazymen_customer/theme/app_colors.dart';
import 'package:eazymen_customer/widgets/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EazyMenGridTile extends StatelessWidget {
  const EazyMenGridTile({super.key});

  // final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        EasyContainer(
          elevation: 0.5,
          height: 180,
          // width: double.infinity,

          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EazymanProfile(
                        eazyMen: EazyMenModel(),
                      )),
            );
          },
          // customPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          //  borderRadius: 16.r,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  top: 8,
                  right: 8,
                  bottom: 2,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black54,
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black54,
                          ),
                        ),
                        height: 60,
                        width: 60,
                        child: Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/eazyman-2e7a7.appspot.com/o/User_images%2FEazyMan.png?alt=media&token=a376abde-5072-4d49-b25d-a7b059f4fb29',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Column(
                          children: [
                            Text(
                              'Amit Bairwa',
                              style: Get.textTheme.titleLarge,
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: EasyContainer(
                                    elevation: 0.5,
                                    padding: 5,
                                    // height: 20.h,
                                    color: EazyColors.dummy,
                                    child: Text(
                                      'AC Technician ',
                                      style: Get.textTheme.bodySmall,
                                      softWrap: true,
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: EasyContainer(
                                    elevation: 0.5,
                                    padding: 5,
                                    // height: 20.h,
                                    color: Colors.blueAccent,

                                    child: Text(
                                      'Electrician',
                                      style: Get.textTheme.bodySmall,
                                      softWrap: true,
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.blueAccent,
                                      ),
                                      Text(
                                        'AC Technician ',
                                        style: Get.textTheme.titleSmall,
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
                                        Icons.book,
                                        color: Colors.blueAccent,
                                      ),
                                      Text(
                                        '350 Jobs ',
                                        style: Get.textTheme.titleSmall,
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
