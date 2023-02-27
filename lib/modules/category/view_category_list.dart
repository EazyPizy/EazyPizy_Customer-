import 'package:eazymen_customer/theme/app_colors.dart';
import 'package:eazymen_customer/theme/eazy_spaces.dart';
import 'package:eazymen_customer/widgets/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(body: ListView.separated());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: Space.scaffoldPadding,
        child: Column(
          children: [
            Space.vertical(12.h),
            SizedBox(
              height: 40.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                separatorBuilder: (context, index) => Space.horizontal(10.w),
                itemBuilder: (context, index) => _CategoryTabItem(
                  isActive: index == 0,
                  label: 'Cat $index',
                  onTap: () {},
                ),
              ),
            ),
            Space.vertical(12.h),
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                separatorBuilder: (context, index) => Space.vertical(10.h),
                itemBuilder: (context, index) => const _EazyMenTile(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _EazyMenTile extends StatelessWidget {
  const _EazyMenTile();

  // final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return EasyContainer(
      onTap: () {},
      customPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      borderRadius: 16.r,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// image section
          const SizedBox.square(
            dimension: 55,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: EazyColors.dummy,
                // shape: BoxShape.circle,
              ),

              /// TODO : To replace with image
              child: SizedBox(),
              // child: Image.network(
              //   product.imageUrl!,
              //   errorBuilder: (context, error, stackTrace) => const SizedBox(),
              // ),
            ),
          ),

          Space.horizontal(12.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Name Man',
                  style: Get.textTheme.headline6,
                ),
                Space.vertical(2.h),
                Text(
                  'Badge',
                  style: Get.textTheme.bodyText1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(Icons.star),
                    Text('4.5'),
                    Icon(Icons.badge),
                    Text('300 Jobs'),
                  ],
                ),
              ],
            ),
          ),
          Space.horizontal(20.w),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}

class _CategoryTabItem extends StatelessWidget {
  const _CategoryTabItem({
    required this.isActive,
    required this.label,
    required this.onTap,
  });
  final VoidCallback onTap;

  final bool isActive;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          // color: isActive ? Colors.black : null,
          border: Border.all(
            color: isActive ? EazyColors.black : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(child: Text(label)),
      ),
    );
  }
}
