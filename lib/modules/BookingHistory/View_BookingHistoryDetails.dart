import 'package:eazymen_customer/modules/Cart/Components/PaymentSummary.dart';
import 'package:eazymen_customer/theme/app_colors.dart';
import 'package:eazymen_customer/theme/eazy_spaces.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_tracker/order_tracker.dart';

import '../../widgets/easy_container.dart';

class BookingHistoryDetails extends StatefulWidget {
  const BookingHistoryDetails({super.key});

  @override
  State<BookingHistoryDetails> createState() => _BookingHistoryDetailsState();
}

List<TextDto> orderList = [
  TextDto('Your order has been placed', "Fri, 25th Mar '22 - 10:47pm"),
  TextDto("Seller ha processed your order", "Sun, 27th Mar '22 - 10:19am"),
  TextDto("Your item has been picked up by courier partner.",
      "Tue, 29th Mar '22 - 5:00pm"),
];

List<TextDto> shippedList = [
  TextDto("Your order has been shipped", "Tue, 29th Mar '22 - 5:04pm"),
  TextDto("Your item has been received in the nearest hub to you.", null),
];

List<TextDto> outOfDeliveryList = [
  TextDto("Your order is out for delivery", "Thu, 31th Mar '22 - 2:27pm"),
];

List<TextDto> deliveredList = [
  TextDto("Your order has been delivered", "Thu, 31th Mar '22 - 3:58pm"),
];

class _BookingHistoryDetailsState extends State<BookingHistoryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Booking ID', style: Get.textTheme.titleMedium)),
      body: SingleChildScrollView(
        padding: Space.scaffoldPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  const Text('Order #01'),
                  const Spacer(),
                  Row(
                    children: [
                      const Icon(
                        Icons.circle,
                        color: Colors.red,
                        size: 10,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('Cancelled', style: Get.textTheme.titleMedium),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              tileColor: EazyColors.white,
              leading: CircleAvatar(
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/eazyman-2e7a7.appspot.com/o/User_images%2FEazyMan.png?alt=media&token=a376abde-5072-4d49-b25d-a7b059f4fb29',
                  fit: BoxFit.fill,
                ),
              ),
              title: Text(
                'Amit bairwa',
                style: Get.textTheme.headlineMedium,
              ),
              subtitle: const Text('4.5 Rating'),
              trailing: const Icon(Icons.chat_outlined),
            ),
            ElevatedButton(onPressed: () {}, child: Text('Book Again')),
            Padding(
              padding: const EdgeInsets.all(20),
              child: OrderTracker(
                status: Status.delivered,
                activeColor: Colors.green,
                inActiveColor: Colors.grey[300],
                orderTitleAndDateList: orderList,
                shippedTitleAndDateList: shippedList,
                outOfDeliveryTitleAndDateList: outOfDeliveryList,
                deliveredTitleAndDateList: deliveredList,
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Get.bottomSheet(

                  EasyContainer(
                    borderRadius: 10,
                    // height: 250,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            'Cancellation Reason',
                            style: Get.textTheme.titleLarge,
                          ),
                        ),
                        ListTile(
                          minVerticalPadding: 5,
                          leading: Icon(Icons.radio_button_off),
                          title: Text(
                            'Incorrect service booked',
                            style: Get.textTheme.titleMedium,
                          ),
                        ),
                        ListTile(
                          minVerticalPadding: 5,
                          leading: Icon(Icons.radio_button_off),
                          title: Text(
                            'Didnt Like the Eazyman',
                            style: Get.textTheme.titleMedium,
                          ),
                        ),
                        ListTile(
                          minVerticalPadding: 5,
                          leading: Icon(Icons.radio_button_off),
                          title: Text(
                            'Dont want the service now',
                            style: Get.textTheme.titleMedium,
                          ),
                        ),
                        ListTile(
                          minVerticalPadding: 5,
                          leading: Icon(Icons.radio_button_off),
                          title: Text(
                            'Will Book again Soon',
                            style: Get.textTheme.titleMedium,
                          ),
                        ),
                        Spacer(),
                        Center(
                            child: OutlinedButton(
                                onPressed: () {},
                                child: Text('Cancel Service',
                                    style: TextStyle(color: Colors.red))))
                      ],
                    ),
                  ),
                );
              },
              child: const Text(
                'Cancle Order',
                style: TextStyle(color: Colors.red),
              ),
            ),
            ListTile(
              leading: EasyContainer(
                borderRadius: 6,
                color: Colors.white,
                borderColor: Colors.blueAccent,
                height: 60,
                width: 60,
                child: Image.asset(
                  'assets/five.jpg',
                ),
              ),
              tileColor: EazyColors.white,
              minLeadingWidth: 8,
              minVerticalPadding: 15,
              title: Text(
                'AC Service and Repair',
                style: Get.textTheme.titleMedium,
              ),
              subtitle: Text(
                'Deep Clean AC Service (Split AC)',
                style: Get.textTheme.titleSmall,
              ),
              trailing: TextButton(onPressed: () {}, child: const Text('2')),
            ),
            ListTile(
              tileColor: EazyColors.white,
              minLeadingWidth: 8,
              minVerticalPadding: 15,
              leading: EasyContainer(
                borderRadius: 6,
                color: Colors.white,
                borderColor: Colors.blueAccent,
                height: 60,
                width: 60,
                child: Image.asset(
                  'assets/five.jpg',
                ),
              ),
              title: Text(
                'AC Service and Repair',
                style: Get.textTheme.titleMedium,
              ),
              subtitle: Text(
                'Deep Clean AC Service (Split AC)',
                style: Get.textTheme.titleSmall,
              ),
              trailing: TextButton(onPressed: () {}, child: const Text('2')),
            ),
            const PaymentSummary()
          ],
        ),
      ),
    );
  }
}
