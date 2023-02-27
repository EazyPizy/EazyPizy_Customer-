import 'package:eazymen_customer/modules/category/view_category_list.dart';
import 'package:eazymen_customer/theme/eazy_spaces.dart';
import 'package:eazymen_customer/widgets/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PopularCategories extends StatelessWidget {
  const PopularCategories({
    super.key,
  });

  // final SubCategoriesListModel items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Popular Categories'),
          Space.vertical(16.h),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              separatorBuilder: (context, index) => Space.horizontal(16.w),
              itemBuilder: (context, index) => _CategoryItem(
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

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({
    required this.isActive,
    required this.label,
    required this.onTap,
  });
  final VoidCallback onTap;

  final bool isActive;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120.w,
      child: Column(
        children: [
          EasyContainer(
            onTap: onTap,
            elevation: 4,
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
            "Plumber and it's services",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13.sp,
            ),
          )
        ],
      ),
    );
  }
}
