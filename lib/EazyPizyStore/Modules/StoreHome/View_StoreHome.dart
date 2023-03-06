import 'package:eazymen_customer/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../modules/category/components/_EazymanGridTile.dart';
import '../../../modules/category/components/popular_categories.dart';
import '../../../modules/category/view_category.dart';
import '../../../modules/home/components/banner.dart';
import '../../../modules/home/components/eazymen_list.dart';
import '../../../theme/eazy_spaces.dart';
import '../../../widgets/easy_container.dart';
import '../../../widgets/eazy_networkimage.dart';
import '../../ProductWidget.dart';
import '../subCategory/view_SubCategory.dart';

class StoreHome extends StatefulWidget {
  const StoreHome({super.key});

  @override
  State<StoreHome> createState() => _StoreHomeState();
}

var top = 0.0;

class _StoreHomeState extends State<StoreHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        'Hardware Store',
                        style: Get.textTheme.headlineMedium,
                      )
                    ],
                  ),
                ),
                background: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Stack(children: const [
                      EazyNetworkImage(
                        url:
                            'https://firebasestorage.googleapis.com/v0/b/authprovider-e4b69.appspot.com/o/cleaningServices.jpg?alt=media&token=f3d12f29-5442-4de0-93dc-f3dc8bc51357',
                        child:
                            'https://thumbs.dreamstime.com/b/person-gray-photo-placeholder-man-shirt-white-background-person-gray-photo-placeholder-man-132818487.jpg',
                      ),

                      // Align(
                      //   alignment:  Alignment.topLeft,
                      //
                      //   child: Align(
                      //     child: CircleAvatar(
                      //       child: IconButton(
                      //
                      //           onPressed: () {},
                      //           icon: const Icon(
                      //             Icons.arrow_back_ios,color: Colors.blueAccent,
                      //           )),
                      //     ),
                      //   ),
                      // ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        'Hardware Store',
                        style: Get.textTheme.headlineLarge!
                            .copyWith(color: EazyColors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        'Connect with your all home care items',
                        style: Get.textTheme.titleMedium!
                            .copyWith(color: EazyColors.black),
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
              Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  // height: 500,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 6,
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
                      return InkWell(
                        onTap: () {
                          Get.to(NavRailExample());
                        },
                        child: Container(
                          color: Colors.blueAccent.withOpacity(0.500),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Space.vertical(12.h),
              const HomeBanner(),
              Space.vertical(12.h),
              const Divider(
                thickness: 15,
                color: EazyColors.lightBlack,
              ),
              Space.vertical(12.h),
              const ProductCardWidget(),
              const ProductGridView() // SizedBox(
              //   //height: 500.h,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     shrinkWrap: true,
              //     // physics: const NeverScrollableScrollPhysics(),
              //     itemCount: 10,
              //     itemBuilder: (context, index) =>  const
              //   ),
              // ),
            ],
          ),
        ),
      ],
    ));
  }
}

class ProductGridView extends StatelessWidget {
  const ProductGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      // number of items in the grid
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        // number of columns in the grid
        mainAxisSpacing: 10,
        mainAxisExtent: 233,
        // spacing between rows
        crossAxisSpacing: 10, // spacing between columns
      ),
      itemBuilder: (BuildContext context, int index) {
        // create a widget for each item in the grid
        return const ProductCardWidget();
      },
    );
  }
}
