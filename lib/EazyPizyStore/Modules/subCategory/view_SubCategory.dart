import 'package:eazymen_customer/EazyPizyStore/ProductWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavRailExample extends StatefulWidget {
  const NavRailExample({super.key});

  @override
  State<NavRailExample> createState() => _NavRailExampleState();
}

class _NavRailExampleState extends State<NavRailExample> {
  List<String> chipText = ['Supreme', 'TruFlow', 'Aashirwaad', "Astral"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Pipes and Fittings',
            style: Get.textTheme.titleMedium,
          ),
        ),
        //backgroundColor: EazyColors.dummy,
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    //height: 200,
                    color: Colors.white60,
                    width: MediaQuery.of(context).size.width * .20,
                    child: ListView.builder(
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8),
                        child: CircleAvatar(
                          child: Text(index.toString()),
                        ),
                      ),
                      itemCount: 100,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: chipText.length,
                              itemBuilder: (context, i) => Padding(
                                    padding: const EdgeInsets.all(6),
                                    child: customChips(chipText[i].toString()),
                                  )),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: GridView.builder(
                              //shrinkWrap: true,
                              // physics: const NeverScrollableScrollPhysics(),
                              itemCount: 10,
                              // number of items in the grid
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      // number of columns in the grid
                                      mainAxisSpacing: 10,
                                      // spacing between rows
                                      crossAxisSpacing: 10,
                                      mainAxisExtent: 233,
                                      // childAspectRatio: MediaQuery.of(context).size.width /
                                      //     (MediaQuery.of(context).size.height),
                                      // spacing between columns
                                      ),
                              itemBuilder: (BuildContext context, int index) {
                                // create a widget for each item in the grid
                                return const ProductCardWidget();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  Widget customChips(String title) {
    return Chip(
      elevation: 1,
      padding: const EdgeInsets.all(8),
      backgroundColor: Colors.greenAccent[100],
      label: Text(
        title,
        style: const TextStyle(fontSize: 10),
      ), //Text
    );
  }
}
