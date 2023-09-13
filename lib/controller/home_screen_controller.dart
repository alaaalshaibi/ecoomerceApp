import 'package:e_commerce_app/view/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int indexPage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currantPage = 0;
  List<Widget> listPage = [
    const HomePage(),
    const Column(
      children: [Center(child: Text('setting'))],
    ),
    const Column(
      children: [Center(child: Text('Profile'))],
    ),
    const Column(
      children: [Center(child: Text('favorite'))],
    ),
  ];
  List<String> namePage = ["Home", "Setting", "Profile", "Favorite"];

  @override
  changePage(indexPage) {
    currantPage = indexPage;
    update();
  }
}
