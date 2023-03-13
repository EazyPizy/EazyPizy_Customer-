import 'package:eazymen_customer/modules/Booking_Done/View_Booking_Done.dart';
import 'package:eazymen_customer/modules/Cart/Components/PaymentSummary.dart';
import 'package:eazymen_customer/modules/EazymanProfile/components/ViewCart_Bottom_Navigation.dart';
import 'package:eazymen_customer/theme/app_colors.dart';
import 'package:eazymen_customer/theme/eazy_spaces.dart';
import 'package:eazymen_customer/widgets/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingSummary extends StatelessWidget {
  const BookingSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Summary', style: Get.textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        padding: Space.scaffoldPadding,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            EasyContainer(
              //height: 400,
              color: EazyColors.white,
              borderRadius: 10,
              borderWidth: 2,
              child: Column(
                children: [
                  ListTile(
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
                  const SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    tileColor: EazyColors.white,
                    minLeadingWidth: 8,
                    minVerticalPadding: 15,
                    title: Text('AC Service and Repair',
                        style: Get.textTheme.titleMedium,),
                    subtitle: Text('Deep Clean AC Service (Split AC)',
                        style: Get.textTheme.titleSmall,),
                    trailing:
                        TextButton(onPressed: () {}, child: const Text('2')),
                  ),
                  const Divider(),
                  ListTile(
                    title: Text('AC Service and Repair',
                        style: Get.textTheme.titleMedium,),
                    subtitle: Text('Deep Clean AC Service (Window AC)',
                        style: Get.textTheme.titleSmall,),
                    trailing:
                        TextButton(onPressed: () {}, child: const Text('1')),
                  ),
                  const Divider(),
                ],
              ),
            ),
              EasyContainer(
                child: ListTile(
                   minLeadingWidth: 8,
                  leading: const Icon(
                    Icons.home,
                    color: Colors.blue,
                    size: 25,
                  ),
                  title: Text(
                    'H.No -C31, Ashok Vihar Phase-2 Gurgaon',
                    style: Get.textTheme.titleMedium,
                  ),
                  trailing: TextButton(
                    onPressed: () {},
                    child: const Text('Change'),
                  ),
            ),),
               EasyContainer(
              child: ListTile(
                minLeadingWidth: 2,
                leading: const Icon(
                  Icons.lock_clock,
                  color: Colors.blue,
                ),
                title: Text(
                  '27 Sep: 11:00 AM',
                  style: Get.textTheme.titleMedium,
                ),
                trailing: TextButton(
                  onPressed: () {},
                  child: const Text('Change'),
                ),
              ),
            ),
            const PaymentSummary()
          ],
        ),
      ),
      bottomNavigationBar: ViewCartBottomNavigation(
        buttonWidget: ElevatedButton(
          onPressed: () {
            Get.to(const ViewBookingDone());
          },
          child: const Text('Confirm Booking'),
        ),
      ),
    );
  }
}
