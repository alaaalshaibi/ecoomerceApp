import 'package:e_commerce_app/core/constant/routes_name.dart';
import 'package:e_commerce_app/core/localization/app_text_lang.dart';
import 'package:e_commerce_app/core/localization/change_locale.dart';
import 'package:e_commerce_app/view/widget/language/custom_button_lang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLanguage extends GetView<LocaleController> {
  const AppLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLang.chooseLang.tr,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            CustomButtonLang(
              onPressed: () {
                controller.changeLang('ar');
                Get.toNamed(AppRoute.onBoarding);
              },
              textButton: 'Ar',
            ),
            CustomButtonLang(
              onPressed: () {
                controller.changeLang('en');
                Get.toNamed(AppRoute.onBoarding);
              },
              textButton: 'En',
            ),
          ],
        ),
      ),
    );
  }
}
