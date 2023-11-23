import 'package:e_commerce_app/controller/offers/offers_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/view/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/favorite/favorite_controller.dart';
import '../../widget/offers/custom_offers_items.dart';
import '../items/search.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => OffersControllerImp());
    FavoriteController controllerFavorite = Get.put(FavoriteController());

    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(8),
      child: GetBuilder<OffersControllerImp>(builder: (controller) {
        return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                CustomAppBarHome(
                  onChanged: (value) {
                    controller.onChangeValue(value);
                  },
                  controllerText: controller.searchText,
                  hintText: 'Find Product',
                  onPressedSearch: () {
                    controller.getSearchData();
                  },
                ),
                controller.isSearch
                    ? SearchView(
                        dataSearchModel: controller.listSearch,
                      )
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.listItemsOffers.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.7, crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          controllerFavorite.isFavorite[
                                  controller.listItemsOffers[index].itemsId] =
                              controller.listItemsOffers[index].favorite;
                          return CustomOffersListItems(
                            itemsModel: controller.listItemsOffers[index],
                          );
                        }),
              ],
            ));
      }),
    );
  }
}
