import 'package:carousel_slider/carousel_slider.dart';
import 'package:eazymen_customer/theme/app_colors.dart';
import 'package:eazymen_customer/theme/eazy_spaces.dart';
import 'package:eazymen_customer/widgets/easy_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StoreShortcut extends StatelessWidget {
  StoreShortcut({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blueAccent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [0.0, 1.0],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Hardware Store',
                style: TextStyle(
                  color: EazyColors.white
                )
              ),
            ),
            Space.vertical(25.h),
            CarouselSlider.builder(
              itemCount: imageList.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Stack(
                children: [
                  EasyContainer(
                    borderRadius: 20,
                    width: 180,
                    height: 300,
                    //color: Colors.red,
                    child: Image.network(
                      imageList[itemIndex],
                       fit: BoxFit.fitHeight,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: EasyContainer(
                      height: 30,
                      width: 100,
                      onTap: () {},
                      child: const Text('Visit'),
                    ),
                  )
                ],
              ),
              options: CarouselOptions(
                enlargeCenterPage: true,
                viewportFraction: 0.5,
                aspectRatio: 2,
                initialPage: 2,
              //  enlargeFactor: 0.3,
              ),
            )
          ],
        )
        // Other container properties go here...
        );
  }

  final List<String> imageList = [
    'https://mykit.in/crm/public/uploads/website_section_image/LyOFHmLMIYWEgG8tsBXweUQN7sTCsu.jpg',
    'https://mykit.in/crm/public/uploads/website_section_image/uZ4cJcyKU1PMyIihywU9qyaWzjojB0.jpg',
    'https://mykit.in/crm/public/uploads/website_section_image/BPCbXgEuhKDSpPTsAVXNKZKc26GDQo.jpg',
   'https://mykit.in/crm/public/uploads/website_slider_images/lHXqadJX5rvVfDY14xpuhC35hnioqO.jpg'
  ];
}
