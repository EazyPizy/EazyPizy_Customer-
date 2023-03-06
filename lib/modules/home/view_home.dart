import 'package:eazymen_customer/modules/home/components/banner.dart';
import 'package:eazymen_customer/modules/home/components/eazymen_list.dart';
import 'package:eazymen_customer/modules/home/ctrl_home.dart';
import 'package:eazymen_customer/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // Get.put(HomeController());
    return GetBuilder(
      init: HomeController(this),
      builder: (controller) {
        return Scaffold(
          backgroundColor: EazyColors.background,
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[

                SliverAppBar(
                  elevation: 0.5,
                  backgroundColor: EazyColors.white,
                  pinned: true,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Hanyman Near You,',
                        style: Get.textTheme.titleMedium,
                      ),
                      //  style: Get.textTheme.bodySmall,

                      Text(
                        'home, H.No C31, Ashok Vihar, Phase 2, Gurgaon',
                        style: Get.textTheme.titleMedium,
                        //  style: Get.textTheme.bodySmall,
                      ),
                    ],
                  ),

                ),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: HomeBanner(),
                  ),
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
                // if (controller.catLoading)
                //   const SizedBox()
                // else
                SliverPersistentHeader(

                  pinned: true,
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      controller: controller.tabController,
                      // onTap: (value) {
                      //   controller.tabController.notifyListeners();
                      // },
                      labelColor: Colors.black87,
                      unselectedLabelColor: Colors.grey, isScrollable: true,
                      tabs: controller.categories
                          .map(
                            (e) => Tab(
                              text: e.serviceName,
                            ),
                          )
                          .toList(),
                      // tabs: [
                      //   Tab(text: 'Near You'),
                      //   Tab(text: 'Plumber'),
                      //   Tab(text: 'AC Technician'),
                      // ],
                    ),
                  ),

                ),


              ];


            },
            body: controller.loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : controller.eazyMen.isEmpty
                    ? const Center(
                        child: Text('Empty'),
                      )
                    : TabBarView(
                        controller: controller.tabController,
                        children: controller.categories
                            .map(
                              (e) => ListView.builder(
                                // shrinkWrap: true,
                                // physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.eazyMen.length,

                                itemBuilder: (context, index) =>
                                    EazyMenTile(controller.eazyMen[index]),
                              ),
                            )
                            .toList(),
                        // children: [
                        //   ListView.builder(
                        //     // shrinkWrap: true,
                        //     // physics: const NeverScrollableScrollPhysics(),
                        //     itemCount: controller.eazyMen.length,

                        //     itemBuilder: (context, index) =>
                        //         EazyMenTile(controller.eazyMen[index]),
                        //   ),
                        // ],
                      ),
            // body: const EazyMenList(),
          ),
        );
      },
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
