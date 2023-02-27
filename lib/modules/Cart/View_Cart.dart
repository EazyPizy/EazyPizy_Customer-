import 'package:eazymen_customer/modules/Cart/Components/selectedEazyman.dart';
import 'package:eazymen_customer/modules/EazyPizy_Store/components/Product_Card2.dart';
import 'package:eazymen_customer/modules/EazymanProfile/components/ViewCart_Bottom_Navigation.dart';
import 'package:eazymen_customer/theme/eazy_spaces.dart';
import 'package:eazymen_customer/widgets/easy_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Apply_Coupans/ApplyCoupons.dart';
import '../Booking_Schedule/View_SelectService_Slot.dart';
import 'Components/PaymentSummary.dart';
import 'Components/service_In_Cart.dart';

class ViewCart extends StatelessWidget {
  const ViewCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartItem = <String>['new'];

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          // iconTheme: AppTheme.lightTheme.iconTheme,

          title: Text(
            'Cart',
            style: Get.textTheme.headlineMedium,
          ),
          actions: const [],
          elevation: 1,
        ),
        body: cartItem.isNotEmpty
            ? Stack(children: [
                SingleChildScrollView(
                  padding: Space.scaffoldPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text('EAZYMAN SELECTED',
                            style: Get.textTheme.labelSmall),
                      ),
                      const selectedEazyman(),
                      const ServiceInCart(),
                      const PaymentSummary(),
                      _applyCoupon(),
                      SizedBox(
                        height: 230,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (i, context) => const ProductCard2()),
                      ),
                      yourSavings(),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 40,
                    color: Colors.green.withOpacity(0.5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Your Earning",
                            style: Get.textTheme.labelSmall,
                          ),
                          Text(
                            "New Value",
                            style: Get.textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ])
            : Container(),
        bottomNavigationBar: ViewCartBottomNavigation(
          buttonWidget: customButtons(context),
        ));
  }
}


Widget customButtons(BuildContext context) {
  return Expanded(
      child: Padding(
    padding: const EdgeInsets.all(8.0),
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
            Get.to(const SelectServiceSlot());
          },
          icon: Icon(Icons.chevron_right),
        )
      ],
    ),
  ));
}

Widget yourSavings() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: EasyContainer(
      elevation: 5,
      color: Colors.blue.withOpacity(0.5),
      height: 50,
      child: Text('You are saving 50Rs', style: Get.textTheme.labelSmall),
    ),
  );
}

Widget _applyCoupon() {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 1,
        child: ListTile(
          onTap: (){
            Get.to(ApplyCoupons());
          },
          title: Text('Apply Coupon', style: Get.textTheme.labelSmall),
          subtitle: Text('Avail Offer and Discount on your Order',
              style: Get.textTheme.labelSmall),
          trailing: const Icon(Icons.navigate_next_outlined),
        ),
      ),
    ),
  );
}

Future _addDeliveryAddress(BuildContext context) {
  TextEditingController houseNumberController = TextEditingController();
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
              child: Text('Save Address', style: Get.textTheme.labelSmall))
        ],
      ),
    ),
  );
}
