import 'package:e_commerce_app/controller/onboarding_controller.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (value) => controller.onPageChanged(value),
        itemCount: listOnBoarding.length,
        itemBuilder: (context, indexPage) {
          return Column(
            children: [
              const SizedBox(height: 50),
              SvgPicture.asset(
                listOnBoarding[indexPage].image!,
                height: Get.width / 1.5,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 20),
              Text(
                listOnBoarding[indexPage].title!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(listOnBoarding[indexPage].body!,
                      style:
                          const TextStyle(height: 2, color: AppColor.black))),
            ],
          );
        });
  }
}
