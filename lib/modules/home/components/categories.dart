import 'package:eazymen_customer/theme/app_colors.dart';
import 'package:eazymen_customer/theme/eazy_spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
  });

  // final SubCategoriesListModel items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        separatorBuilder: (context, index) => Space.horizontal(4),
        itemBuilder: (context, index) => Center(
          child: _CategoryTabItem(
            isActive: index == 0,
            label: 'All',
            onTap: () {},
          ),
        ),
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
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        decoration: BoxDecoration(
          // color: isActive ? Colors.black : null,
          border: Border.all(
            color: isActive ? EazyColors.black : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(label),
      ),
    );
  }
}
