import 'package:e_commerce_app/controller/favorite_controller.dart';
import 'package:e_commerce_app/core/functions/translate_data_base.dart';
import 'package:e_commerce_app/data/model/my_favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app_link.dart';
import '../../../core/constant/color.dart';

class CustomListFavoriteItems extends GetView<FavoriteController> {
  final MyFavoriteModel myFavoriteModel;
  const CustomListFavoriteItems({
    super.key,
    required this.myFavoriteModel,
  });

  @override
  Widget build(BuildContext context) {
    FavoriteController controller = Get.put(FavoriteController());
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: InkWell(
        onTap: () {},
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Hero(
                  tag: "${myFavoriteModel.itemsId}",
                  child: Image.network(
                    width: Get.width,
                    height: Get.width / 3.8,
                    fit: BoxFit.fill,
                    "${AppLink.imageItems}/${myFavoriteModel.itemsImage}",
                  ),
                ),
                Text(
                  translateDataBase("${myFavoriteModel.itemsNameAr}",
                      "${myFavoriteModel.itemsName}"),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  translateDataBase("${myFavoriteModel.itemsDescriptionAr}",
                      "${myFavoriteModel.itemsDescription}"),
                  style: const TextStyle(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
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
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${myFavoriteModel.itemsPrice} \$ ",
                      style: const TextStyle(color: AppColor.primaryColor),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          controller
                              .removeFavoriteView(myFavoriteModel.favoriteId!);
                        },
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.delete))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
