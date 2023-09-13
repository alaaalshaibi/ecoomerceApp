import 'package:e_commerce_app/controller/items_controller.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/core/functions/translate_data_base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/categories_model.dart';

class ListCatagoriesItems extends GetView<ItemsControllerImp> {
  const ListCatagoriesItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 40,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 15,
        ),
        itemCount: controller.catagoriesItems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Catagories(
            indexCat: index,
            categoriesModel:
                CategoriesModel.fromJson(controller.catagoriesItems[index]),
          );
        },
      ),
    );
  }
}

class Catagories extends StatelessWidget {
  final int? indexCat;
  final CategoriesModel categoriesModel;
  const Catagories({
    Key? key,
    required this.indexCat,
    required this.categoriesModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsControllerImp>(builder: (controller) {
      return InkWell(
        onTap: () {
          controller.changeTabCat(indexCat!, categoriesModel.categoriesId!);
        },
        child: Container(
          decoration: controller.isSelected == indexCat
              ? const BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: AppColor.primaryColor)))
              : null,
          child: Text(
              translateDataBase("${categoriesModel.categoriesNameAr}",
                  "${categoriesModel.categoriesName}"),
              style: const TextStyle(
                fontSize: 20,
              )),
        ),
      );
    });
  }
}
