import 'package:e_commerce_app/core/constant/routes_name.dart';
import 'package:e_commerce_app/view/screen/home/home.dart';
import 'package:e_commerce_app/view/screen/setting/setting_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int indexPage);
  goToCart();
}

class HomeScreenControllerImp extends HomeScreenController {
  int currantPage = 0;
  List<Widget> listPage = [
    const HomePage(),
    const Column(
      children: [Center(child: Text('Profile'))],
    ),
    const Column(
      children: [Center(child: Text('favorite'))],
    ),
    const SettingScreen(),
  ];
  List bottomAppBar = [
    {'title': 'Home', 'icon': Icons.home},
    {'title': 'Favorite', 'icon': Icons.notifications_none},
    {'title': 'Profile', 'icon': Icons.person_2_outlined},
    {'title': 'Setting', 'icon': Icons.settings_outlined},
  ];
// "Home", "Setting", "Profile", "Favorite"
  @override
  changePage(indexPage) {
    currantPage = indexPage;
    update();
  }

  @override
  goToCart() {
    Get.toNamed(AppRoute.cartScreen);
  }
}
