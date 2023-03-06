import 'package:eazymen_customer/modules/Cart/View_Cart.dart';
import 'package:eazymen_customer/modules/EazymanProfile/components/EazyMan_Info_Card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widgets/easy_container.dart';
import '../home/components/banner.dart';
import '../home/components/eazymen_list.dart';
import 'components/CustomerRivewTile.dart';
import 'components/Easyman_ServiceCard.dart';
import 'components/ViewCart_Bottom_Navigation.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EazymanProfile extends StatefulWidget {
  const EazymanProfile({super.key});

  @override
  State<EazymanProfile> createState() => _EazymanProfileState();
}

class _EazymanProfileState extends State<EazymanProfile> {
  var top = 0.0;
  bool _isAppBarExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                elevation: 0.5,
                backgroundColor: Colors.white,
                automaticallyImplyLeading: !_isAppBarExpanded,
                pinned: true,
                // title: Text("Plumber",
                // style: TextStyle(
                //   color: Colors.black
                // ),
                // ),
                expandedHeight: 250,
                flexibleSpace: LayoutBuilder(
                  builder: (ctx, cons) {
                    top = cons.biggest.height;

                    return FlexibleSpaceBar(
                      titlePadding: const EdgeInsets.only(left: 30, bottom: 8),
                      centerTitle: true,
                      title: AnimatedOpacity(
                        duration: Duration(milliseconds: 100),
                        opacity: top <= 130 ? 1.0 : 0.0,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 12.w,
                            ),
                            const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://firebasestorage.googleapis.com/v0/b/eazyman-2e7a7.appspot.com/o/User_images%2FEazyMan.png?alt=media&token=a376abde-5072-4d49-b25d-a7b059f4fb29'),
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Text(
                              'Amit Bairwa',
                              style: Get.textTheme.headlineMedium,
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                          ],
                        ),
                      ),
                      background: const Padding(
                        padding: EdgeInsets.only(
                          top: 90,
                        ),
                        child: VisitingCard(),

                      ),

                    );
                  },
                ),
              ),

              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Top Reviews'),
                          TextButton(
                              onPressed: viewAllReviews,
                              child: Text('View All'))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, i) => CustomerReviewTile(
                          index: i,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // SliverToBoxAdapter(
              //     child: SizedBox(
              //   height: 50,
              //   child: ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       itemCount: 100,
              //       itemBuilder: (context, i) => Card(
              //           elevation: 1,
              //           child: Padding(
              //             padding: const EdgeInsets.all(8),
              //             child: Center(child: Text(' $i Best Review')),
              //           ))),
              // )),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  const TabBar(
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(text: 'Near You'),
                      Tab(text: 'Plumber'),
                      Tab(text: 'AC Technician'),
                    ],
                  ),
                ),
              )
            ];
          },
          body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, i) => const EazymanServiceCard(),
          ),
        ),
      ),
      bottomNavigationBar: ViewCartBottomNavigation(
        buttonWidget: customButtons(),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return ColoredBox(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

Widget customButtons() {
  return Expanded(
      child: Padding(
    padding: const EdgeInsets.all(8),
    child: ElevatedButton(
      onPressed: () {
        Get.to(const ViewCart());
      },
      child: const Text('View Cart'),
    ),
  ));
}

Future viewAllReviews() {
  late final _ratingController;
  late double _rating;

  double _userRating = 3.0;
  int _ratingBarMode = 1;
  double _initialRating = 2.0;
  bool _isRTLMode = false;
  bool _isVertical = false;

  IconData? _selectedIcon;
  return Get.bottomSheet(EasyContainer(
      child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Customer Reviews',
              style: Get.textTheme.titleMedium,
            ),
            SizedBox(
              width: 100,
              height: 30,
              child: FittedBox(
                child: Image.asset('assets/EazymenLogo.png'),
              ),
            )
          ],
        ),
        Row(
          children: [
            Text(
              '4.9',
              style: Get.textTheme.headlineLarge,
            ),
            const SizedBox(
              width: 80,
            ),
            Column(
              children: [
                RatingBar.builder(
                  initialRating: _initialRating,
                  minRating: 1,
                  direction: _isVertical ? Axis.vertical : Axis.horizontal,
                  allowHalfRating: true,
                  unratedColor: Colors.amber.withAlpha(50),
                  itemCount: 5,
                  itemSize: 15.0,
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
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              const Text('Excellent(149)'),
              const SizedBox(
                width: 50,
              ),
              Container(
                height: 5,
                width: 150,
                decoration: const BoxDecoration(color: Colors.green),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              const Text('Good(199)'),
              const SizedBox(
                width: 74,
              ),
              Container(
                height: 5,
                width: 100,
                decoration: const BoxDecoration(color: Colors.green),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              const Text('Average(99)'),
              const SizedBox(
                width: 60,
              ),
              Container(
                height: 5,
                width: 100,
                decoration: const BoxDecoration(color: Colors.red),
              )
            ],
          ),
        )
      ],
    ),
  )));
}
