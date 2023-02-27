import 'package:eazymen_customer/modules/category/components/popular_categories.dart';
import 'package:eazymen_customer/theme/app_colors.dart';
import 'package:eazymen_customer/theme/eazy_spaces.dart';
import 'package:eazymen_customer/widgets/easy_container.dart';
import 'package:eazymen_customer/widgets/eazy_networkimage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: Space.scaffoldPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Find the Best',
              style: Get.textTheme.headline1!.copyWith(color: EazyColors.black),
            ),
            Row(
              children: [
                Text(
                  'EazyMen ',
                  style: Get.textTheme.headline1!
                      .copyWith(color: EazyColors.amber),
                ),
                Text(
                  'Near you',
                  style: Get.textTheme.headline1!
                      .copyWith(color: EazyColors.black),
                ),
              ],
            ),
            Space.vertical(12.h),
            const PopularCategories(),
            Space.vertical(16.h),
            EasyContainer(
              height: 140.h,
              color: EazyColors.dummy,
              child: const SizedBox(),
            ),
            Space.vertical(24.h),
            const TopRatedSection(),
          ],
        ),
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
          Text(
            'Services',
            style: Get.textTheme.headline1!.copyWith(color: EazyColors.black),
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
              itemBuilder: (context, index) => Column(
                children: [
                  EasyContainer(
                    padding: 4,
                    color: const Color(0xFFf6f6f6),
                    child: EazyNetworkImage(
                        url:
                            'https://thumbs.dreamstime.com/b/person-gray-photo-placeholder-man-shirt-white-background-person-gray-photo-placeholder-man-132818487.jpg'),
                    // child: CachedNetworkImage(
                    //   imageUrl:
                    //       'https://thumbs.dreamstime.com/b/person-gray-photo-placeholder-man-shirt-white-background-person-gray-photo-placeholder-man-132818487.jpg',
                    // ),
                  ),
                  Space.vertical(4.h),
                  const Text('Plumbing')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
