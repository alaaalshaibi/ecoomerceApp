import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/routes_name.dart';
import 'package:e_commerce_app/view/widget/home/list_items_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/home_controller.dart';
import '../../widget/home/custom_promotion_card.dart';
import '../../widget/custom_app_bar.dart';
import '../../widget/home/custom_title.dart';
import '../../widget/home/list_catagories_home.dart';
import '../items/search.dart';

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
                onChanged: (value) {
                  controller.onChangeValue(value);
                },
                controllerText: controller.searchText,
                hintText: 'Find Product',
                onPressedSearch: () {
                  controller.getSearchData();
                },
                onPressedFavorite: () {
                  Get.toNamed(AppRoute.myFavorite);
                }),
            controller.isSearch
                ? SearchView(
                    dataSearchModel: controller.listSearch,
                  )
                : const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomPromotionCard(
                        titleText: 'add offers order',
                        bodyText: 'you can order discount 10%',
                      ),
                      ListCatagoriesHome(),
                      SizedBox(height: 10),
                      CustomTitleHome(
                        titleHome: "Product For You",
                      ),
                      ListItemsHome(),
                      CustomTitleHome(
                        titleHome: "Offers",
                      ),
                      ListItemsHome(),
                    ],
                  )
          ],
        ),
      );
    });
  }
}
