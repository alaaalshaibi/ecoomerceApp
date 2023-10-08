import 'package:e_commerce_app/controller/favorite/favorite_controller.dart';
import 'package:e_commerce_app/controller/items/items_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/data/model/items_model.dart';
import 'package:e_commerce_app/view/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/items/custom_list_items.dart';
import '../../widget/items/list_catagories_items.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    FavoriteController controllerFavorite = Get.put(FavoriteController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            CustomAppBarHome(
              hintText: 'Find Product',
              onPressedSearch: () {},
              onPressedFavorite: () {
                controller.goToFavoriteScreen();
              },
            ),
            const ListCatagoriesItems(),
            GetBuilder<ItemsControllerImp>(builder: (controller) {
              return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.itemsView.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.7, crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        controllerFavorite.isFavorite[
                                controller.itemsView[index]['items_id']] =
                            controller.itemsView[index]['favorite'];
                        return CustomListItems(
                          itemsModel:
                              ItemsModel.fromJson(controller.itemsView[index]),
                        );
                      }));
            })
          ],
        ),
      ),
    );
  }
}
