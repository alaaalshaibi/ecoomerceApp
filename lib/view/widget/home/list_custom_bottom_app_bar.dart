import 'package:e_commerce_app/controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import 'custom_bottom_app_bar.dart';

class ListCustomBottomAppBar extends StatelessWidget {
  const ListCustomBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(builder: (controller) {
      return BottomAppBar(
        height: 55,
        color: AppColor.bottomAppBar,
        notchMargin: 3,
        shape: const AutomaticNotchedShape(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18))),
            RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(18)))),
        child: Row(
          children: [
            ...List.generate(controller.listPage.length + 1, (index) {
              int i = index > 2 ? index - 1 : index;
              return index == 2
                  ? const Spacer()
                  : CustomBottomAppBarHome(
                      iconBtn: controller.bottomAppBar[i]['icon'],
                      onPressedBtn: () => controller.changePage(i),
                      isActive: controller.currantPage == i ? true : false,
                    );
            })
          ],
        ),
      );
    });
  }
}
