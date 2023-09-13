import 'package:e_commerce_app/controller/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app_link.dart';
import '../../../core/constant/color.dart';

class TopProductDetails extends GetView<ProductDetailsControllerImp> {
  const TopProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: Get.width,
          height: Get.width / 4,
          decoration: const BoxDecoration(
            color: AppColor.primaryColor,
          ),
        ),
        Hero(
          tag: "${controller.itemsModel.itemsId}",
          child: Image.network(
              "${AppLink.imageItems}/${controller.itemsModel.itemsImage}",
              width: Get.width,
              height: Get.width / 1.7,
              fit: BoxFit.fill),
        ),
      ],
    );
  }
}
