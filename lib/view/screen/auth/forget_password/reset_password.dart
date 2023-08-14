import 'package:e_commerce_app/controller/auth/forget_password_controller/reset_password_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/core/functions/validator_input.dart';
import 'package:e_commerce_app/core/localization/app_text_lang.dart';
import 'package:e_commerce_app/view/widget/auth/custom_body_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_button_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_text_form_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: AppBar(
        title: Text(
          AppLang.resetPassword.tr,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.grey),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: AppColor.backgroundcolor,
      ),
      body: GetBuilder<ResetPasswordControllerImp>(builder: (controller) {
        return HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Form(
              key: controller.keyForm,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                child: ListView(children: [
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTitleAuth(titleText: AppLang.newPassword.tr),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomBodyAuth(
                    bodyText: AppLang.enterNewPassword.tr,
                  ),
                  const SizedBox(
                    height: 65,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormAuth(
                    obscureText: controller.obscure,
                    suffixOnPressed: () => controller.showPassword(),
                    hintText: AppLang.enterPassword.tr,
                    textLabel: AppLang.password.tr,
                    suffixIcon: Icons.lock_outline,
                    txtController: controller.passwordController,
                    validator: (value) {
                      return validatorInput(value!, 5, 20, AppLang.password);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormAuth(
                    obscureText: controller.obscureRePass,
                    suffixOnPressed: () => controller.showRePassword(),
                    hintText: AppLang.enterNewPassword.tr,
                    textLabel: AppLang.password.tr,
                    suffixIcon: Icons.lock_outline,
                    txtController: controller.rePasswordController,
                    validator: (value) {
                      return validatorInput(value!, 5, 20, AppLang.password);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButtonAuth(
                    textbtn: AppLang.save.tr,
                    onPressed: () => controller.resetPassword(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ]),
              ),
            ));
      }),
    );
  }
}
