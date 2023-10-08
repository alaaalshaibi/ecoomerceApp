import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomCheckOutBtn extends StatelessWidget {
  const CustomCheckOutBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: Get.width / 1.5,
      color: AppColor.primaryColor,
      textColor: Colors.white,
      onPressed: () {},
      child: const Text("Check Out"),
    );
  }
}
