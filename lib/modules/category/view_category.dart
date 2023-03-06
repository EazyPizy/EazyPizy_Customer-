import 'package:cached_network_image/cached_network_image.dart';
import 'package:eazymen_customer/modules/category/components/_EazymanGridTile.dart';
import 'package:eazymen_customer/modules/category/components/popular_categories.dart';
import 'package:eazymen_customer/modules/home/components/banner.dart';
import 'package:eazymen_customer/theme/app_colors.dart';
import 'package:eazymen_customer/theme/eazy_spaces.dart';
import 'package:eazymen_customer/widgets/easy_container.dart';
import 'package:eazymen_customer/widgets/eazy_networkimage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

double top = 0;

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EazyColors.dummy,
      body: CustomScrollView(

        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            //  title: Text('EazyPizy Store', style: Get.textTheme.titleMedium),
            elevation: 0.5,
            pinned: true,
            backgroundColor: EazyColors.white,
            expandedHeight: 320,
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
                        const SizedBox(
                          width: 12,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          'Home Servicesss',
                          style: Get.textTheme.headlineMedium,
                        )
                      ],
                    ),
                  ),
                  background: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const EazyNetworkImage(
                        url:
                            'https://firebasestorage.googleapis.com/v0/b/authprovider-e4b69.appspot.com/o/cleaningServices.jpg?alt=media&token=f3d12f29-5442-4de0-93dc-f3dc8bc51357',
                        child:
                            'https://thumbs.dreamstime.com/b/person-gray-photo-placeholder-man-shirt-white-background-person-gray-photo-placeholder-man-132818487.jpg',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Text(
                          'Find the Best',
                          style: Get.textTheme.headlineLarge!
                              .copyWith(color: EazyColors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 8,
                          left: 8,
                          right: 8,
                        ),
                        child: Row(
                          children: [
                            Text(
                              'EazyMen',
                              style: Get.textTheme.headlineLarge!
                                  .copyWith(color: EazyColors.amber),
                            ),
                            Text(
                              'Near you',
                              style: Get.textTheme.headlineLarge!
                                  .copyWith(color: EazyColors.black),
                            ),
                          ],
                        ),
                      ),

                      // Stack(children: [
                      //   Image.network(
                      //     'https://firebasestorage.googleapis.com/v0/b/authprovider-e4b69.appspot.com/o/cleaningServices.jpg?alt=media&token=f3d12f29-5442-4de0-93dc-f3dc8bc51357',
                      //     fit: BoxFit.cover,
                      //   ),
                      //   Align(
                      //     alignment: Alignment.bottomCenter,
                      //     child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           // SizedBox(
                      //           //   height: 50,
                      //           // ),
                      //            Text(
                      //             'Find the Best',
                      //             style: Get.textTheme.headlineLarge!
                      //                 .copyWith(color: EazyColors.black),
                      //           ),
                      //           Row(
                      //             children: [
                      //               Text(
                      //                 'EazyMen ',
                      //                 style: Get.textTheme.headlineLarge!
                      //                     .copyWith(color: EazyColors.amber),
                      //               ),
                      //               Text(
                      //                 'Near you',
                      //                 style: Get.textTheme.headlineLarge!
                      //                     .copyWith(color: EazyColors.black),
                      //               ),
                      //             ],
                      //           ),
                      //         ]),
                      //   )
                      // ]),
                    ],
                  ),
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Space.vertical(12.h),
                const PopularCategories(),
                Space.vertical(12.h),
                const HomeBanner(),
                Space.vertical(12.h),
                const Divider(
                  thickness: 15,
                  color: EazyColors.lightBlack,
                ),
                Space.vertical(12.h),
                const TopRatedSection(),
                Space.vertical(12.h),
                SizedBox(
                  height: 500.h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) => const EazyMenGridTile()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TopRatedSection extends StatelessWidget {
  const TopRatedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Space.vertical(12.h),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text('Services', style: Get.textTheme.titleLarge),
          ),
          Space.vertical(12.h),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 16.w,
                childAspectRatio: 0.7,
                mainAxisSpacing: 10.h,
              ),
              itemCount: 12,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Column(children: [
                EasyContainer(
                  padding: 4,
                  color: const Color(0xFFf6f6f6),
                  child: EazyNetworkImage(
                    url:
                        'https://thumbs.dreamstime.com/b/person-gray-photo-placeholder-man-shirt-white-background-person-gray-photo-placeholder-man-132818487.jpg',
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://thumbs.dreamstime.com/b/person-gray-photo-placeholder-man-shirt-white-background-person-gray-photo-placeholder-man-132818487.jpg',
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
