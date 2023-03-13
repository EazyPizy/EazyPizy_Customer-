import 'package:eazymen_customer/modules/Cart/View_Cart.dart';
import 'package:eazymen_customer/modules/EazymanProfile/components/CustomerRivewTile.dart';
import 'package:eazymen_customer/modules/EazymanProfile/components/Easyman_ServiceCard.dart';
import 'package:eazymen_customer/modules/EazymanProfile/components/EazyMan_Info_Card.dart';
import 'package:eazymen_customer/modules/EazymanProfile/components/ViewCart_Bottom_Navigation.dart';
import 'package:eazymen_customer/modules/EazymanProfile/ctrl_profile.dart';
import 'package:eazymen_customer/modules/home/components/simmerLoader.dart';
import 'package:eazymen_customer/modules/home/models/model_home.dart';
import 'package:eazymen_customer/theme/app_colors.dart';
import 'package:eazymen_customer/widgets/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EazymanProfile extends StatelessWidget {
  const EazymanProfile({super.key, required this.eazyMen});

  final EazyMenModel eazyMen;

  @override
  Widget build(BuildContext context) {
    var top = 0.0;
    // final controller = Get.put();
    return Scaffold(
      body: GetBuilder<ProfileController>(
        init: ProfileController(eazyMen),
        builder: (controller) {
          return DefaultTabController(
            length: controller.userCategories.length,
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    surfaceTintColor: EazyColors.white,
                    // backgroundColor: EazyColors.background,

                    pinned: true,
                    // title: Text("Plumber",
                    // style: TextStyle(
                    //   color: Colors.black
                    // ),
                    // ),
                    expandedHeight: 210.h,
                    flexibleSpace: LayoutBuilder(
                      builder: (ctx, cons) {
                        top = cons.biggest.height;

                        return FlexibleSpaceBar(
                          centerTitle: true,
                          title: AnimatedOpacity(
                            duration: const Duration(milliseconds: 100),
                            opacity: top <= 130 ? 1.0 : 0.0,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 55.w,
                                ),
                                const CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    'https://firebasestorage.googleapis.com/v0/b/eazyman-2e7a7.appspot.com/o/User_images%2FEazyMan.png?alt=media&token=a376abde-5072-4d49-b25d-a7b059f4fb29',
                                  ),
                                ),
                                SizedBox(
                                  width: 12.w,
                                ),
                                InkWell(
                                  onTap: controller.getUserSubServices,
                                  child: Text(
                                    eazyMen.personalDetail?.firstName ?? '',
                                    style: Get.textTheme.headlineMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          background: Column(
                            children: [
                              SizedBox(
                                height: 75.h,
                              ),
                              VisitingCard(
                                eazyMenModel: eazyMen,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: EasyContainer(
                      color: EazyColors.white,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Top Reviews'),
                                TextButton(
                                  onPressed: viewAllReviews,
                                  child: Text('View All'),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 65.h,
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
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _SliverAppBarDelegate(
                      TabBar(
                        labelColor: EazyColors.dummy,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: EazyColors.dummy,
                        tabs: controller.userCategories
                            .map(
                              (e) => Tab(
                                text: e.serviceName,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  )
                ];
              },
              body: controller.loading
                  ? const Center(child: ShimmerLoader())
                  : TabBarView(
                      // controller: controller.tabController,
                      children: controller.userCategories
                          .map(
                            (e) => ListView.separated(
                              shrinkWrap: true,
                              // physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  controller.userSubServiceCategories.length,
                              itemBuilder: (context, index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8,
                                      right: 8,
                                    ),
                                    child: Text(
                                      controller.userSubServiceCategories[index]
                                              .subServiceName ??
                                          '',
                                      style: Get.textTheme.titleLarge,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: controller
                                          .getSubServiceProduct(
                                            controller.userSubServiceCategories[
                                                index],
                                          )
                                          .length,
                                      itemBuilder: (context, _) {
                                        return InkWell(
                                          onTap: () {
                                            controller.addToCart(
                                              controller.getSubServiceProduct(
                                                controller
                                                        .userSubServiceCategories[
                                                    index],
                                              )[_],
                                            );
                                          },
                                          child: EazymanServiceCard(
                                            serviceProdName: controller
                                                    .getSubServiceProduct(
                                                      controller
                                                              .userSubServiceCategories[
                                                          index],
                                                    )[_]
                                                    .serviceProductName ??
                                                '',
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              separatorBuilder:
                                  (BuildContext context, int index) => Divider(
                                color: Colors.grey.shade50,
                                thickness: 5,
                              ),
                            ),
                          )
                          .toList(),
                    ),
            ),
          );
        },
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
    ),
  );
}

Future<void> viewAllReviews() {
  late final ratingController;
  late double rating;

  const userRating = 3;
  const ratingBarMode = 1;
  const initialRating = 2;
  const isRTLMode = false;
  const isVertical = false;

  IconData? selectedIcon;
  return Get.bottomSheet(
    EasyContainer(
      child: Padding(
        padding: const EdgeInsets.all(20),
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
                      initialRating: initialRating.toDouble(),
                      minRating: 1,
                      allowHalfRating: true,
                      unratedColor: Colors.amber.withAlpha(50),
                      itemSize: 15,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                      itemBuilder: (context, _) => Icon(
                        selectedIcon ?? Icons.star,
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
              padding: const EdgeInsets.all(4),
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
              padding: const EdgeInsets.all(4),
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
              padding: const EdgeInsets.all(4),
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
      ),
    ),
  );
}
