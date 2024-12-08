import 'package:flutter/material.dart';
import 'package:scrview/constants.dart';
import 'package:scrview/screen/Detail/detail.dart';
import 'package:scrview/screen/Home/home.dart';
import 'package:scrview/screen/cart/cart.dart';
import 'package:scrview/screen/favorite_screen.dart/favorite.dart';
import 'package:scrview/screen/profile/profile_screen.dart';

class BottomNaviBar extends StatefulWidget {
  const BottomNaviBar({super.key});

  @override
  State<BottomNaviBar> createState() => _BottomNaviBarState();
}

class _BottomNaviBarState extends State<BottomNaviBar> {
  int currentIndex = 2;
  List screens = const [
    Scaffold(),
    Favorite(),
    HomeScreen(),
    CartScreen(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: kprimaryColor,
        onPressed: () {
          setState(() {
            currentIndex = 2;
          });
        },
        child: Icon(
          Icons.home,
          color: Colors.white,
          size: 40,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 60,
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
                icon: Icon(
                  Icons.grid_view_outlined,
                  color:
                      currentIndex == 0 ? kprimaryColor : Colors.grey.shade400,
                  size: 30,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
                icon: Icon(
                  Icons.favorite_border_outlined,
                  color:
                      currentIndex == 1 ? kprimaryColor : Colors.grey.shade400,
                  size: 30,
                )),
            SizedBox(
              width: 14,
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 3;
                  });
                },
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color:
                      currentIndex == 3 ? kprimaryColor : Colors.grey.shade400,
                  size: 30,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 4;
                  });
                },
                icon: Icon(
                  Icons.person,
                  color:
                      currentIndex == 4 ? kprimaryColor : Colors.grey.shade400,
                  size: 30,
                )),
          ],
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
