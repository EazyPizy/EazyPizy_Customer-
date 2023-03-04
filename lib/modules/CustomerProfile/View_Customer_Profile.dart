import 'package:eazymen_customer/modules/BookingHistory/View_Booking_History.dart';
import 'package:eazymen_customer/theme/app_colors.dart';
import 'package:eazymen_customer/theme/eazy_spaces.dart';
import 'package:eazymen_customer/widgets/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class CustomerProfile extends StatelessWidget {
  const CustomerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    late final _ratingController;
    late double _rating;

    double _userRating = 3.0;
    int _ratingBarMode = 1;
    double _initialRating = 2.0;
    bool _isRTLMode = false;
    bool _isVertical = false;

    IconData? _selectedIcon;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Text(
          'Profile',
          style: Get.textTheme.headlineMedium,
        ),
        backgroundColor: EazyColors.appBarBG,
      ),
      backgroundColor: EazyColors.background,
      body: Column(
        children: [
          EasyContainer(
            color: Colors.blue,
            padding: 20,
            borderRadius: 10,
            elevation: 0.5,
            child: ListTile(
              minLeadingWidth: 10,
              leading: CircleAvatar(
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/eazyman-2e7a7.appspot.com/o/User_images%2FEazyMan.png?alt=media&token=a376abde-5072-4d49-b25d-a7b059f4fb29',
                  fit: BoxFit.fill,
                ),
              ),
              title: Text(
                "Customer Name",
                style: Get.textTheme.titleMedium,
              ),
              subtitle: Text('9874563210'),
            ),
          ),
          // SizedBox(
          //   height: 150,
          // ),
          ListTile(
            tileColor: EazyColors.white,
            onTap: () {
              Get.to(() => const BookingHistory());
            },
            leading: const Icon(Icons.savings_outlined),
            title: const Text('Orders'),
            trailing: const Icon(
              Icons.chevron_right,
              color: Colors.blueAccent,
            ),
          ),
          const ListTile(
            tileColor: EazyColors.white,
            leading: Icon(Icons.home_work),
            title: Text('Save Address'),
            trailing: Icon(
              Icons.chevron_right,
              color: Colors.blueAccent,
            ),
          ),
          const ListTile(
            tileColor: EazyColors.white,
            onTap: rateRazyPizy,
            leading: Icon(Icons.home_work),
            title: Text('Rate EazyPizy on Play Store'),
            trailing: Icon(
              Icons.chevron_right,
              color: Colors.blueAccent,
            ),
          ),
          ListTile(
            tileColor: EazyColors.white,
            onTap: () {
              Get.defaultDialog(radius: 10, title: 'Are you sure');
            },
            leading: const Icon(Icons.access_alarm_outlined),
            title: const Text('LogOut'),
            trailing: const Icon(
              Icons.chevron_right,
              color: Colors.blueAccent,
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 75,
            width: 75,
            child: Image.asset('assets/EazymenLogo.png'),
          )
        ],
      ),
    );
  }
}

Future rateRazyPizy() {
  late final _ratingController;
  late double _rating;

  double _userRating = 3.0;
  int _ratingBarMode = 1;
  double _initialRating = 2.0;
  bool _isRTLMode = false;
  bool _isVertical = false;

  IconData? _selectedIcon;
  return Get.bottomSheet(EasyContainer(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RatingBar.builder(
                  initialRating: _initialRating,
                  minRating: 1,
                  direction: _isVertical ? Axis.vertical : Axis.horizontal,
                  allowHalfRating: true,
                  unratedColor: Colors.amber.withAlpha(50),
                  itemCount: 5,
                  itemSize: 30.0,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    _selectedIcon ?? Icons.star,
                    color: Colors.green,
                  ),
                  onRatingUpdate: (rating) {
                    // setState(() {
                    //   _rating = rating;
                    // });
                  },
                  updateOnDrag: true,
                ),
                Text('349 Ratings', style: Get.textTheme.bodySmall)
              ],
            ),
            const SizedBox(
              width: 50,
            ),
          ],
        ),
      )));
}
