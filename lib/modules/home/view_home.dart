import 'package:eazymen_customer/modules/home/components/banner.dart';
import 'package:eazymen_customer/modules/home/components/eazymen_list.dart';
import 'package:eazymen_customer/theme/eazy_spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';
import '../../widgets/easy_container.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      backgroundColor: EazyColors.background,

      body: DefaultTabController(

        length: 3,
        child: NestedScrollView(

            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(

                  elevation: 0.5,
                  backgroundColor: EazyColors.appBarBG,
                  pinned: true,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Hanyman Near You,',
                          style: Get.textTheme.titleMedium),
                      //  style: Get.textTheme.bodySmall,

                      Text('home, H.No C31, Ashok Vihar, Phase 2, Gurgaon',
                          style: Get.textTheme.titleMedium
                          //  style: Get.textTheme.bodySmall,
                          ),
                    ],
                  ),
                  //  expandedHeight: 330,
                  // flexibleSpace:  const FlexibleSpaceBar(
                  //
                  //   // centerTitle: true,
                  //
                  //   background: HomeBanner(),
                  //
                  //
                  // ),
                ),
                SliverToBoxAdapter(
                  child: HomeBanner(),
                ),

                // child: SizedBox(
                //   height: 50,
                //   child: ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       itemCount: 10,
                //       itemBuilder: (context, i) => Padding(
                //         padding: const EdgeInsets.all(8),
                //         child: CircleAvatar(child: Text(' $i ')),
                //       )),
                // )),

                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverAppBarDelegate(
                    const TabBar(
                      labelColor: Colors.black87,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(text: 'Near You'),
                        Tab(text: 'Plumber'),
                        Tab(text: 'AC Technician'),
                      ],
                    ),
                  ),
                ),
              ];
            },
            body: const EazyMenList()),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return ColoredBox(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
