import 'package:eazymen_customer/modules/home/components/banner.dart';
import 'package:eazymen_customer/modules/home/components/categories.dart';
import 'package:eazymen_customer/modules/home/components/eazymen_list.dart';
import 'package:eazymen_customer/theme/eazy_spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: Space.scaffoldPadding,
          child: Column(
            children: [
              Space.vertical(12),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hanyman Near You,',
                          style: Get.textTheme.bodySmall,
                        ),
                        Text(
                          'home, H.No C31, Ashok Vihar, Phase 2, Gurgaon',
                          style: Get.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  // const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.message_rounded),
                  ),
                ],
              ),
              Space.vertical(12.h),
              const HomeBanner(),
              Space.vertical(12.h),
              const Categories(),
              Space.vertical(12.h),
              const EazyMenList(),
              Container(
                height: 200,
                color: Colors.black,
                child: Text("New Text"),
              )

            ],
          ),
        ),
      ),
    );
  }
}
