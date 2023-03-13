import 'package:carousel_slider/carousel_slider.dart';
import 'package:eazymen_customer/theme/app_colors.dart';
import 'package:eazymen_customer/theme/eazy_spaces.dart';
import 'package:eazymen_customer/widgets/easy_container.dart';
import 'package:eazymen_customer/widgets/eazy_networkimage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../EazymanProfile/components/Easyman_ServiceCard.dart';
import '../home/components/CarouselImage.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

double top = 0;
final List<String> imageList = [
  'https://mykit.in/crm/public/uploads/website_section_image/LyOFHmLMIYWEgG8tsBXweUQN7sTCsu.jpg',
  'https://mykit.in/crm/public/uploads/website_section_image/uZ4cJcyKU1PMyIihywU9qyaWzjojB0.jpg',
  'https://mykit.in/crm/public/uploads/website_section_image/BPCbXgEuhKDSpPTsAVXNKZKc26GDQo.jpg',
  // 'https://mykit.in/crm/public/uploads/website_slider_images/lHXqadJX5rvVfDY14xpuhC35hnioqO.jpg'
];


const String assetName = 'assets/svg_Icons/Fridge-optimized.svg';
final Widget svgIcon = SvgPicture.asset(
    assetName,
   // colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
  //  semanticsLabel: 'A red up arrow'
);
class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(body: ListView.separated());
    return Scaffold(
      // appBar: AppBar(
      //   title:  Text('ServiceCat', style: Get.textTheme.titleMedium,),
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
           //expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background:
              Container(
                color: Colors.white,
              ),
              title: AnimatedOpacity(
                duration: const Duration(milliseconds: 100),
                opacity: top <= 130 ? 1.0 : 0.0,
                child: Row(
                  children: [
                    Text(
                      'Services Name',
                      style: Get.textTheme.headlineMedium,
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const EazyNetworkImage(
                  url:
                      'https://firebasestorage.googleapis.com/v0/b/authprovider-e4b69.appspot.com/o/cleaningServices.jpg?alt=media&token=f3d12f29-5442-4de0-93dc-f3dc8bc51357',
                ),
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
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue.withOpacity(0.05),
                            border: Border.all(
                              color: Colors.blue.withOpacity(0.05),
                            ),
                          ),
                          child: svgIcon,
                        );
                      },
                    ),
                  ),
                ),
                ListView.separated(
                    shrinkWrap: true,
                     physics: const NeverScrollableScrollPhysics(),
                    itemCount:2,
                    itemBuilder: (context, index) =>
                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Text(
                                    'ServiceNAme',
                                style: Get.textTheme.titleLarge,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics:
                                const NeverScrollableScrollPhysics(),
                                itemCount: 3,
                                itemBuilder: (context, _) {
                                  return const EazymanServiceCard(
                                    serviceProdName: "serviceProd",
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                    separatorBuilder:
                        (BuildContext context, int index) =>
                        Divider(
                          color: Colors.grey.shade50,
                          thickness: 5,
                        )),

              ],
            ),
          ),
        ],
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




