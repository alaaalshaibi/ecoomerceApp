import 'package:e_commerce_app/controller/favorite/favorite_controller.dart';
import 'package:e_commerce_app/controller/items/items_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/routes_name.dart';
import 'package:e_commerce_app/view/screen/items/search.dart';
import 'package:e_commerce_app/view/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/items/custom_list_items.dart';
import '../../widget/items/list_catagories_items.dart';

class ItemsScreen extends GetView<ItemsControllerImp> {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    FavoriteController controllerFavorite = Get.put(FavoriteController());
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
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
                onPressedFavorite: () {
                  controllerFavorite.viewFavorite();
                  Get.toNamed(AppRoute.myFavorite);
                },
              ),
              const ListCatagoriesItems(),
              GetBuilder<ItemsControllerImp>(builder: (controller) {
                return HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: controller.isSearch
                        ? SearchView(dataSearchModel: controller.listSearch)
                        : GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.itemsView.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 0.65, crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              controllerFavorite.isFavorite[
                                      controller.itemsView[index].itemsId] =
                                  controller.itemsView[index].favorite;
                              return CustomListItems(
                                itemsModel: controller.itemsView[index],
                              );
                            }));
              })
            ],
          ),
        ),
      ),
    );
  }
}
