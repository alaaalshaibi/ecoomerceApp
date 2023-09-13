import 'package:e_commerce_app/core/functions/translate_data_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../app_link.dart';
import '../../../controller/home_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/categories_model.dart';

class ListCatagoriesHome extends GetView<HomeControllerImp> {
  const ListCatagoriesHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 15,
        ),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Catagories(
            i: index,
            categoriesModel:
                CategoriesModel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class Catagories extends GetView<HomeControllerImp> {
  final int? i;
  final CategoriesModel categoriesModel;
  const Catagories({
    Key? key,
    required this.i,
    required this.categoriesModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItemsPage(
            controller.categories, i!, categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColor.primaryColor),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 100,
            width: 80,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.network(
                  "${AppLink.imageCategories}/${categoriesModel.categoriesImage}"),
            ),
          ),
          Text(translateDataBase(
            "${categoriesModel.categoriesNameAr}",
            "${categoriesModel.categoriesName}",
          )),
        ],
      ),
    );
  }
}
