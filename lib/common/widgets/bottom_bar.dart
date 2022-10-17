import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shop_app/constants/global_variables.dart';
import 'package:shop_app/features/account/screens/account_screen.dart';
import 'package:shop_app/features/auth/screens/home_screen.dart';
import 'package:shop_app/features/cart/screens/cart_screen.dart';
import 'package:shop_app/providers/user_provider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;
  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const CartScreen(),
  ];
  void updatepage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: CurvedNavigationBar(
        index: _page,
        color: GlobalVariables.secondaryColor,
        backgroundColor: Colors.transparent,
        onTap: updatepage,
        items: [
          const Icon(
            Icons.home_outlined,
            size: 30,
            color: Colors.white,
          ),
          const Icon(
            Icons.person_outline_outlined,
            size: 30,
            color: Colors.white,
          ),
          Badge(
            badgeContent: Text(
              userCartLen.toString(),
              style: const TextStyle(color: Colors.white),
            ),
            badgeColor: Colors.red,
            elevation: 0,
            child: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
