import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_groups_201/bottom_bar_screen/bottom_bar_cubit.dart';
import 'package:flutter_groups_201/home_screen.dart';
import 'package:flutter_groups_201/personal_screen.dart';
import 'package:flutter_groups_201/search_product_screen.dart';
import 'package:flutter_groups_201/shopping_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBarScreen2 extends StatefulWidget {
  const BottomBarScreen2({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen2> createState() => _BottomBarScreenState2();
}

class _BottomBarScreenState2 extends State<BottomBarScreen2> {
  final pages = [
    const HomeScreen(),
    const ShoppingScreen(),
    const SearchProductScreen(),
    const PersonalScreen(),
  ];

  Color activateColor = Colors.deepOrange;
  late final BottomBarCubit _cubit;

  @override
  void initState() {
    _cubit = BottomBarCubit();
    super.initState();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return _cubit;
      },
      //BlocConsumer
      //BlocListener
      child: BlocBuilder<BottomBarCubit, BottomBarState>(
        buildWhen: (previous, current) {
          return previous.selectedIndex != current.selectedIndex ||
              previous.displayNumber != current.displayNumber;
        },
        builder: (context, state) {
          return Scaffold(
            body: pages[state.selectedIndex],
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
              currentIndex: state.selectedIndex,
              onTap: (index) {
                _cubit.onItemTapped(index);
              },
              elevation: 5,
            ),
          );
        },
      ),
    );
  }
}
