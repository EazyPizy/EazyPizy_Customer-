import 'package:eazymen_customer/modules/Cart/View_Cart.dart';
import 'package:eazymen_customer/modules/CustomerProfile/View_Customer_Profile.dart';
import 'package:eazymen_customer/modules/home/view_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';

import '../../EazyPizyStore/Modules/StoreHome/View_StoreHome.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  _NavigationViewState createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  int _selectedPageIndex = 0;

  final List<Widget> _pages = [
    const HomeView(),
    const SizedBox(),
    const ViewCart(),
    const CustomerProfile(),
    // const SizedBox(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: _pages[_selectedPageIndex],
        backgroundColor: Colors.white,
        bottomNavigationBar: CustomBottomNavigationBar(
          iconList: const [
            Icons.home,
            Icons.category_rounded,
            Icons.shopping_cart,
            Icons.person,
          ],
          onChange: (index) {
            setState(() {
              _selectedPageIndex = index;
            });
          },
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(StoreHome());
            // Navigator.of(context).pushNamed('EazyPizyStore.routeName');
          },
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 2,
          tooltip: 'Increment',
          child: const Icon(Icons.store),
        ),
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key,
    this.defaultSelectedIndex = 0,
    required this.iconList,
    required this.onChange,
  });

  final int defaultSelectedIndex;
  final void Function(int index) onChange;
  final List<IconData> iconList;

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  List<IconData> _iconList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
  }

  @override
  Widget build(BuildContext context) {
    final navBarItemList = <Widget>[];

    for (var i = 0; i < _iconList.length; i++) {
      navBarItemList.add(buildNavBarItem(_iconList[i], i));
    }
    return Row(
      children: navBarItemList,
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
        notchMargin: 0.5,


        child: GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: (MediaQuery.of(context).size.width / _iconList.length) - 30,
        margin: const EdgeInsets.only(left: 15, right: 15),
        decoration: index == _selectedIndex
            ? const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 3,
                    color: Colors.blue,
                  ),
                ),
              )
            : const BoxDecoration(),
        child: Icon(
          icon,
          color: index == _selectedIndex ? Colors.blueAccent : Colors.grey,
        ),
      ),
    ));
  }
}
