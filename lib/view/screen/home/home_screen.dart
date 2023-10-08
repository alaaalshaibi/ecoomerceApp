import 'package:e_commerce_app/controller/home/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../widget/home/list_custom_bottom_app_bar.dart';

class HomeScreen extends GetView<HomeScreenControllerImp> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(builder: (controller) {
      return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
            foregroundColor: AppColor.backgroundcolor,
            backgroundColor: AppColor.primaryColor,
            onPressed: () {
              controller.goToCart();
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: const Icon(Icons.shopping_cart)),
        bottomNavigationBar: const ListCustomBottomAppBar(),
        body: controller.listPage.elementAt(controller.currantPage),
      );
    });
  }
}
