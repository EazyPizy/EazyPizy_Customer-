import 'package:eazymen_customer/EazyPizyStore/Modules/StoreHome/View_StoreHome.dart';
import 'package:eazymen_customer/modules/Cart/View_Cart.dart';
import 'package:eazymen_customer/modules/CustomerProfile/View_Customer_Profile.dart';
import 'package:eazymen_customer/modules/category/view_category.dart';
import 'package:eazymen_customer/modules/home/view_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  _NavigationViewState createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  int _selectedPageIndex = 0;

  final List<Widget> _pages = [
    const HomeView(),
    const CategoryView(),
    const ViewCart(),
    const CustomerProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: _pages[_selectedPageIndex],
        bottomNavigationBar: BottomAppBar(
          notchMargin: 5,
          shape: const CircularNotchedRectangle(),
          child: CustomBottomNavigationBar(
            iconList: const [
              Icons.home,
              Icons.category_rounded,
          //    Icons.cake_sharp,
              Icons.shopping_cart,
              Icons.person,
            ],
            onChange: (index) {
              setState(() {
                _selectedPageIndex = index;
              });
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(const StoreHome());
            // Navigator.of(context).pushNamed('EazyPizyStore.routeName');
          },
          // backgroundColor: Colors.blueAccent,
          elevation: 5,
          tooltip: 'Increment',
          child: const Icon(Icons.store),
        ),
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    super.key,
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: navBarItemList,
    );
  }




  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: ((MediaQuery.of(context).size.width) / _iconList.length) - 30,
        // margin: const EdgeInsets.only( right: 30, ),
        decoration: index == _selectedIndex
            ? const BoxDecoration(
                // color: Colors.green,
                border: Border(
                  top: BorderSide(
                    width: 3,
                    color: Colors.blueAccent,
                  ),
                ),
              )
            : const BoxDecoration(),
        child: Icon(
          icon,
          color: index == _selectedIndex ? Colors.blueAccent : Colors.grey,
        ),
      ),
    );
  }
}
