import 'package:e_commerce_app/controller/items/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class SubItems extends GetView<ProductDetailsControllerImp> {
  const SubItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ...List.generate(controller.subItems.length, (index) {
          return Container(
            alignment: Alignment.center,
            width: 80,
            height: 50,
            decoration: BoxDecoration(
                color: controller.subItems[index]["isActive"] == 1
                    ? AppColor.primaryColor
                    : null,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColor.primaryColor)),
            child: Text(
              controller.subItems[index]["name"],
              style: TextStyle(
                  color: controller.subItems[index]["isActive"] == 1
                      ? Colors.white
                      : AppColor.primaryColor,
                  fontSize: 20),
            ),
          );
        })
      ],
    );
  }
}
