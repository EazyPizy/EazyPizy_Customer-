import 'package:eazymen_customer/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../modules/home/components/eazymen_list.dart';

class StoreHome extends StatefulWidget {
  const StoreHome({super.key});

  @override
  State<StoreHome> createState() => _StoreHomeState();
}
var top = 0.0;

class _StoreHomeState extends State<StoreHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          title: Text('EazyPizy Store', style: Get.textTheme.titleMedium),
          elevation: 0,
          pinned: true,
          backgroundColor: EazyColors.secondary,
          expandedHeight: 250,
          flexibleSpace:LayoutBuilder(
            builder: (ctx, cons) {
              top = cons.biggest.height;

              return FlexibleSpaceBar(
                centerTitle: true,
                title: AnimatedOpacity(
                  duration: Duration(milliseconds: 100),
                  opacity: top <= 130 ? 1.0 : 0.0,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 12,
                      ),
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://firebasestorage.googleapis.com/v0/b/eazyman-2e7a7.appspot.com/o/User_images%2FEazyMan.png?alt=media&token=a376abde-5072-4d49-b25d-a7b059f4fb29'),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        'Amit Bairwa',
                        style: Get.textTheme.headlineMedium,
                      )
                    ],
                  ),
                ),
                background:  Padding(
                  padding: const EdgeInsets.only(
                    top: 90,
                  ),
                  child: Container(
                    color: Colors.green,
                    child: Text('New try'),
                  )
                ),
              );
            },
          ),
        ),
        SliverToBoxAdapter(
          child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  height: 100,
                  child: Text(index.toString()))),
        )
      ],
    ));
  }
}
