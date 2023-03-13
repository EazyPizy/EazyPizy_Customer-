import 'package:eazymen_customer/modules/home/models/model_home.dart';
import 'package:eazymen_customer/theme/app_colors.dart';
import 'package:eazymen_customer/widgets/easy_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VisitingCard extends StatelessWidget {
  const VisitingCard({super.key, required this.eazyMenModel});

  final EazyMenModel eazyMenModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: EasyContainer(
        padding: 8,
        color: EazyColors.white,
        showBorder: false,
        elevation: 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            eazyMenModel.personalDetail?.firstName??'',
                            textScaleFactor: 1.5,
                            style: Get.textTheme.titleMedium
                            ),
                          ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [Text("149"), Text("Jobs")],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [Text('4.5'), Text('Rating')],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  [
                                Text(eazyMenModel.personalDetail?.experiance.toString()?? ''),
                                const Text('Experience')
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: SizedBox(
                      height: 100,
                      width: 80,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        child: Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/eazyman-2e7a7.appspot.com/o/User_images%2FEazyMan.png?alt=media&token=a376abde-5072-4d49-b25d-a7b059f4fb29',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Delhi  | NCR",
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: "Roboto",
                  fontSize: 12.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}