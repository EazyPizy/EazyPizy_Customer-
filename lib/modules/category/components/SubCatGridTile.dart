import 'package:eazymen_customer/modules/EazymanProfile/View_EazymanProfile.dart';
import 'package:eazymen_customer/modules/home/models/model_home.dart';
import 'package:eazymen_customer/theme/app_colors.dart';
import 'package:eazymen_customer/widgets/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCatGridTile extends StatelessWidget {
  const SubCatGridTile({super.key});

  // final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        // height: 500,
        child: Column(
          children: [
            Row(
              children: const [
                Text('ServiceName')
              ],
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 9,
              // number of items in the grid
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                // number of columns in the grid
                mainAxisSpacing: 10,
                // spacing between rows
                crossAxisSpacing: 10, // spacing between columns
              ),
              itemBuilder: (BuildContext context, int index) {
                // create a widget for each item in the grid
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue.withOpacity(0.05),
                    border: Border.all(
                      color: Colors.blue.withOpacity(0.05),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
