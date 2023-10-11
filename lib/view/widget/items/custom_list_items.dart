import 'package:e_commerce_app/controller/favorite/favorite_controller.dart';
import 'package:e_commerce_app/controller/items/items_controller.dart';
import 'package:e_commerce_app/core/constant/image_assets.dart';
import 'package:e_commerce_app/core/functions/translate_data_base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app_link.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/items_model.dart';

class CustomListItems extends StatelessWidget {
  final ItemsModel itemsModel;
  const CustomListItems({
    super.key,
    required this.itemsModel,
  });

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: InkWell(
        onTap: () {
          controller.goToProductDetails(itemsModel);
        },
        child: Card(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    // Positioned(
                    //     child: Image.asset(
                    //   AppImageAssets.sellImage,
                    //   height: 50,
                    //   width: 50,
                    // )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Hero(
                          tag: "${itemsModel.itemsId}",
                          child: Image.network(
                            width: Get.width,
                            height: Get.width / 3.8,
                            fit: BoxFit.fill,
                            "${AppLink.imageItems}/${itemsModel.itemsImage}",
                          ),
                        ),
                        Text(
                          translateDataBase("${itemsModel.itemsNameAr}",
                              "${itemsModel.itemsName}"),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          translateDataBase("${itemsModel.itemsDescriptionAr}",
                              "${itemsModel.itemsDescription}"),
                          style: const TextStyle(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Rating 3.5"),
                            const Spacer(),
                            ...List.generate(
                                5,
                                (index) => const Icon(Icons.star_border,
                                    size: 15, color: Colors.amberAccent))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "${itemsModel.itemsPriceDiscount} \$ ",
                                style: const TextStyle(
                                    fontSize: 20, color: AppColor.primaryColor),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                              height: 20,
                              child: GetBuilder<FavoriteController>(
                                  builder: (controllerFavorite) {
                                return MaterialButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      if (controllerFavorite
                                              .isFavorite[itemsModel.itemsId] ==
                                          '1') {
                                        controllerFavorite.setFavorite(
                                            itemsModel.itemsId, '0');
                                        controllerFavorite.removeFavorite(
                                            itemsModel.itemsId!);
                                      } else {
                                        controllerFavorite.setFavorite(
                                            itemsModel.itemsId, '1');
                                        controllerFavorite
                                            .addFavorite(itemsModel.itemsId!);
                                      }
                                    },
                                    child: Icon(
                                      controllerFavorite.isFavorite[
                                                  itemsModel.itemsId] ==
                                              '1'
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: Colors.red,
                                    ));
                              }),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              if (itemsModel.itemsDiscount != "0")
                Positioned(
                    child: Image.asset(
                  AppImageAssets.sellImage,
                  height: 40,
                  width: 40,
                )),
            ],
          ),
        ),
      ),
    );
  }
}
