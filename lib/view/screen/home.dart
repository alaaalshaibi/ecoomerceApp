import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/view/widget/home/list_items_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../widget/home/custom_promotion_card.dart';
import '../widget/custom_app_bar.dart';
import '../widget/home/custom_title.dart';
import '../widget/home/list_catagories_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(builder: (controller) {
      return HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            const SizedBox(height: 25),
            CustomAppBarHome(
              hintText: 'Find Product',
              onPressed: () {},
              onPressedSearch: () {},
            ),
            const CustomPromotionCard(
              titleText: 'add offers order',
              bodyText: 'you can order discount 10%',
            ),
            const ListCatagoriesHome(),
            const SizedBox(height: 10),
            const CustomTitleHome(
              titleHome: "Product For You",
            ),
            const ListItemsHome(),
            const CustomTitleHome(
              titleHome: "Offers",
            ),
            const ListItemsHome(),
          ],
        ),
      );
    });
  }
}
