import 'package:e_commerce_app/controller/auth/onboarding/onboarding_controller.dart';
import 'package:e_commerce_app/view/widget/onboarding/custom_button.dart';
import 'package:e_commerce_app/view/widget/onboarding/custom_slider.dart';
import 'package:e_commerce_app/view/widget/onboarding/dot_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: CustomSliderOnBoarding(),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    CustomDotControllerOnBoarding(),
                    Spacer(
                      flex: 2,
                    ),
                    CustomButtonOnBoarding()
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
