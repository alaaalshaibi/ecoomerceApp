import 'package:e_commerce_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomPromotionCard extends StatelessWidget {
  final String titleText;
  final String bodyText;
  const CustomPromotionCard({
    super.key,
    required this.titleText,
    required this.bodyText,
  });

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    return Container(
      height: 150,
      width: Get.width,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Card(
        child: Stack(
          children: [
            Container(
              height: 150,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                title: Text(
                  titleText,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
                subtitle: Text(
                  bodyText,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Positioned(
              top: -60,
              right: myServices.sharedPreferences.getString("lang") == "ar"
                  ? null
                  : -70,
              left: myServices.sharedPreferences.getString("lang") == "ar"
                  ? -70
                  : null,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.circular(300)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
