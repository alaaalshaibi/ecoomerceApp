import 'package:e_commerce_app/controller/favorite/favorite_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/view/screen/items/search.dart';
import 'package:e_commerce_app/view/widget/custom_app_bar.dart';
import 'package:e_commerce_app/view/widget/favorite/custom_list_favorite_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteController());
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(10),
          child: GetBuilder<FavoriteController>(builder: (controller) {
            return ListView(
              children: [
                CustomAppBarHome(
                  isFavorite: false,
                  isBack: true,
                  onChanged: (value) {
                    controller.onChangeValue(value);
                  },
                  controllerText: controller.searchText,
                  hintText: 'Find Product',
                  onPressedSearch: () {
                    controller.getSearchData();
                  },
                ),
                const SizedBox(height: 15),
                controller.isSearch
                    ? SearchView(dataSearchModel: controller.listSearch)
                    : GetBuilder<FavoriteController>(builder: (controller) {
                        return HandlingDataView(
                            statusRequest: controller.statusRequest,
                            widget: GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 0.68,
                                        crossAxisCount: 2),
                                itemCount: controller.dataViewFavorite.length,
                                itemBuilder: (context, index) {
                                  return CustomListFavoriteItems(
                                      myFavoriteModel:
                                          controller.dataViewFavorite[index]);
                                }));
                      })
              ],
            );
          }),
        ),
      ),
    );
  }
}
