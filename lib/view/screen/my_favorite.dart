import 'package:e_commerce_app/controller/favorite_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/view/widget/custom_app_bar.dart';
import 'package:e_commerce_app/view/widget/favorite/custom_list_favorite_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends GetView<FavoriteController> {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            CustomAppBarHome(
              hintText: "Find Product",
              onPressed: () {},
              onPressedSearch: () {},
              onPressedFavorite: () {},
            ),
            const SizedBox(height: 15),
            GetBuilder<FavoriteController>(builder: (controller) {
              return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.68, crossAxisCount: 2),
                      itemCount: controller.dataViewFavorite.length,
                      itemBuilder: (context, index) {
                        return CustomListFavoriteItems(
                            myFavoriteModel:
                                controller.dataViewFavorite[index]);
                      }));
            })
          ],
        ),
      ),
    );
  }
}
