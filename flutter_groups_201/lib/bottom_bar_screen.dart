import 'package:flutter/material.dart';
import 'package:flutter_groups_201/personal_screen.dart';
import 'package:flutter_groups_201/search_product_screen.dart';
import 'package:flutter_groups_201/shopping_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home_screen.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final pages = [
    HomeScreen(),
    ShoppingScreen(),
    SearchProductScreen(),
    PersonalScreen(),
  ];

  Color activateColor = Colors.deepOrange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/vectors/ic_home.svg",
            ),
            label: '',
            activeIcon: SvgPicture.asset(
              "assets/vectors/ic_home.svg",
              color: activateColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/vectors/ic_shopping_bag.svg",
            ),
            label: '',
            activeIcon: SvgPicture.asset(
              "assets/vectors/ic_shopping_bag.svg",
              color: activateColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/vectors/ic_search.svg",
            ),
            label: '',
            activeIcon: SvgPicture.asset(
              "assets/vectors/ic_search.svg",
              color: activateColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/vectors/ic_user.svg",
            ),
            label: '',
            activeIcon: SvgPicture.asset(
              "assets/vectors/ic_user.svg",
              color: activateColor,
            ),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 5,
      ),
    );
  }
}
