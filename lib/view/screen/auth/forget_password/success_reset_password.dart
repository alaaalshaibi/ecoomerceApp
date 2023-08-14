import 'package:e_commerce_app/controller/auth/forget_password_controller/success_reset_password_controller.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/core/localization/app_text_lang.dart';
import 'package:e_commerce_app/view/widget/auth/custom_button_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessRestPassword extends StatelessWidget {
  const SuccessRestPassword({super.key});
  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller =
        Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: AppBar(
        title: Text(
          AppLang.success.tr,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.grey),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: AppColor.backgroundcolor,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const Center(
                child: Icon(
              Icons.check_circle_outline,
              size: 200,
              color: AppColor.primaryColor,
            )),
            Text(AppLang.congratulations.tr),
            const SizedBox(height: 10),
            Text(AppLang.successRegis.tr),
            const Spacer(
              flex: 3,
            ),
            CustomButtonAuth(
              textbtn: AppLang.goToLogin.tr,
              onPressed: () => controller.goToLogin(),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
