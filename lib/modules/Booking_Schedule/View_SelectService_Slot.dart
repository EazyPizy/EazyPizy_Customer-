import 'package:eazymen_customer/modules/Booking_Summary/BookingSummary.dart';
import 'package:eazymen_customer/modules/EazymanProfile/components/ViewCart_Bottom_Navigation.dart';
import 'package:eazymen_customer/theme/app_colors.dart';
import 'package:eazymen_customer/theme/eazy_spaces.dart';
import 'package:eazymen_customer/widgets/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectServiceSlot extends StatelessWidget {
  const SelectServiceSlot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: EazyColors.appBarBG,
        title: Text(
          'Select Slot',
          style: Get.textTheme.headlineMedium,
        ),
      ),
      backgroundColor: EazyColors.background,
      body: SingleChildScrollView(
        padding: Space.scaffoldPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              tileColor: EazyColors.primary,
              title: Text('When are you available for Service'),
              subtitle: Text('please select the date and time slot'),
            ),
            SizedBox(
              height: 50,
              child: Text(
                'Select Date',
                style: Get.textTheme.titleLarge,
              ),
            ),
            EasyContainer(
              height: 100,
              color: EazyColors.primary,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 30,
                itemBuilder: (context, i) => Padding(
                  padding: const EdgeInsets.all(8),
                  child: EasyContainer(
                    onTap: () {},
                    height: 50,
                    padding: 8,
                    color: Colors.white,
                    borderColor: Colors.blueAccent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          i.toString(),
                          style: Get.textTheme.titleLarge,
                        ),
                        Text(
                          'Sept.',
                          style: Get.textTheme.titleSmall,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: Text(
                'Select Time',
                style: Get.textTheme.titleLarge,
              ),
            ),
            EasyContainer(
              color: EazyColors.primary,
              height: 300,
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, i) => Padding(
                  padding: const EdgeInsets.all(8),
                  child: EasyContainer(
                    //height: 12,
                    padding: 8,
                    borderRadius: 6,
                    color: Colors.white,
                    borderColor: Colors.green,
                    // color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${i.toString()} : 00',
                          style: Get.textTheme.titleLarge,
                        ),
                        Text(
                          "PM",
                          style: Get.textTheme.titleSmall,
                        )
                      ],
                    ),
                  ),
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  // number of columns in the grid
                  mainAxisSpacing: 5,
                  // spacing between rows
                  crossAxisSpacing: 5, // spacing between columns
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: ViewCartBottomNavigation(
        buttonWidget: ElevatedButton(
          onPressed: () {
            Get.to(const BookingSummary());
          },
          child: const Text('Next'),
        ),
      ),
    );
  }
}
