import 'package:e_commerce_app/controller/cart/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomCheckOutBtn extends GetView<CartControllerImp> {
  const CustomCheckOutBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // CartControllerImp controllerImp = Get.put(CartControllerImp());
    return MaterialButton(
      minWidth: Get.width / 1.5,
      color: AppColor.primaryColor,
      textColor: Colors.white,
      onPressed: () {
        controller.goToCheckOut();
      },
      child: const Text("Order"),
    );
  }
}
