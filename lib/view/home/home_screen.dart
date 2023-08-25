import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:meelmedicose/view/category/category.dart';
import 'package:meelmedicose/view/home/homo.dart';
import 'package:meelmedicose/view/Profile/profile.dart';

import 'package:meelmedicose/view_models/controller/home/home_screen_model.dart';
import 'package:meelmedicose/view_models/controller/user_preference/user_preference_screen_model.dart';

import '../product/cart/cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = Get.put(HomeController());

  UserPreference userPreference = UserPreference();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.userListApi();
  }

  final item = const [
    Icon(Icons.home, color: Colors.white, size: 30),
    Icon(Icons.category, color: Colors.white, size: 30),
    Icon(Icons.shopping_cart, color: Colors.white, size: 30),
    Icon(Icons.person, color: Colors.white, size: 30)
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          items: item,
          index: index,
          onTap: (selectIndex) {
            setState(() {
              index = selectIndex;
            });
          },
          color: const Color(0xFF37a497),
          height: 50,
          backgroundColor: Colors.transparent,
          animationDuration: const Duration(milliseconds: 300),
        ),
        body: Container(
          alignment: Alignment.center,
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child: getSelectedWidget(index: index),
        ));
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        widget = const Home();
        break;
      case 1:
        widget = const Category();
        break;
      case 2:
        widget = const CartScreen();
        break;

      default:
        widget = const ProfileScreen();
    }
    return widget;
  }
}
