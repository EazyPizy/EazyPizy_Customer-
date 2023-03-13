import 'package:eazymen_customer/modules/category/view_category_list.dart';
import 'package:eazymen_customer/modules/home/models/main_category.dart';
import 'package:eazymen_customer/theme/app_colors.dart';
import 'package:eazymen_customer/theme/eazy_spaces.dart';
import 'package:eazymen_customer/widgets/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PopularCategories extends StatelessWidget {
   const PopularCategories({
    super.key,
  });
  // MainCategoryModel mainCategoryModel;

  // final SubCategoriesListModel items;

  @override
  Widget build(BuildContext context) {
    return EasyContainer(
      color: EazyColors.white,
      padding: 8,
      height: 180.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Popular Categories', style: Get.textTheme.titleLarge),
          Space.vertical(16.h),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              separatorBuilder: (context, index) => Space.horizontal(16.w),
              itemBuilder: (context, index) => CategoryItem(
                isActive: index == 0,
                label: 'All',
                onTap: () {
                  Get.to(const CategoryList());
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
    CategoryItem({super.key,
    required this.isActive,
    required this.label,
    required this.onTap,

  });

  final VoidCallback onTap;

  final bool isActive;
  final String label;
 late  MainCategoryModel mainCategoryModel;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110.w,
      child: Column(
        children: [
          EasyContainer(
            color: EazyColors.background,
            onTap: onTap,
            elevation: 2,
            borderRadius: 10.r,
            child: SizedBox(
              height: 68.h,
              child: Image.network(
                'https://www.architectureartdesigns.com/wp-content/uploads/2018/10/plumber.jpg',
              ),
            ),
          ),
          Space.vertical(12.h),
          Text(
          'mainService',

           // textAlign: TextAlign.center,
            // style: TextStyle(
            //   fontWeight: FontWeight.bold,
            //   fontSize: 13.sp,
            // ),
          )
        ],
      ),
    );
  }
}
