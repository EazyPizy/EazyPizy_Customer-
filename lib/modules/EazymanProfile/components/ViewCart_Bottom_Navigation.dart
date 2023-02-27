import 'package:eazymen_customer/modules/Cart/View_Cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

class ViewCartBottomNavigation extends StatelessWidget {

  const ViewCartBottomNavigation({
    required this.buttonWidget,
    super.key,
  });
  final Widget buttonWidget;

  @override
  Widget build(BuildContext context) {
    final cartItem = <String>['new'];

    return cartItem.isNotEmpty
        ? DecoratedBox(
            decoration: const BoxDecoration(

              color: Colors.white60,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150,
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ' Items ${50}',
                            style: Get.textTheme.labelSmall,
                          ),
                          Text(
                            ' Rs. ${500}',
                            style: Get.textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                  buttonWidget,
                ],
              ),
            ),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Add Item To Cart',
                style: Get.textTheme.labelSmall,
              ),
              Center(
                child: buttonWidget,

                // ElevatedButton(
                //     onPressed: () {},
                //     child: Text(
                //       'Shop Now',
                //       style: Get.textTheme.labelSmall,
                //     ),),
              )
            ],
          );
  }
}
