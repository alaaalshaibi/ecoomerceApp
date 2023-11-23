import 'package:e_commerce_app/core/constant/routes_name.dart';
import 'package:e_commerce_app/view/screen/home/home.dart';
import 'package:e_commerce_app/view/screen/notification/view_notification.dart';
import 'package:e_commerce_app/view/screen/offers/offers.dart';
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
    const ViewNotification(),
    const OffersView(),
    const SettingScreen(),
  ];
  List bottomAppBar = [
    {'title': 'Home', 'icon': Icons.home_outlined},
    {'title': 'Notifications', 'icon': Icons.notifications_none},
    {'title': 'Offers', 'icon': Icons.discount_outlined},
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
