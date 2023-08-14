import 'package:e_commerce_app/controller/auth/forget_password_controller/check_email_forget_password_controller.dart';
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

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: AppBar(
        title: Text(
          AppLang.forGetPassword.tr,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.grey),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: AppColor.backgroundcolor,
      ),
      body: GetBuilder<ForgetPasswordControllerImp>(builder: (controller) {
        return HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Form(
              key: controller.keyForm,
              child: SingleChildScrollView(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  child: Column(children: [
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTitleAuth(titleText: AppLang.checkEmail.tr),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomBodyAuth(
                      bodyText: AppLang.enterVerifyCode.tr,
                    ),
                    const SizedBox(
                      height: 65,
                    ),
                    CustomTextFormAuth(
                      hintText: AppLang.enterEmail.tr,
                      textLabel: AppLang.email.tr,
                      suffixIcon: Icons.email_outlined,
                      txtController: controller.emailController,
                      validator: (value) {
                        return validatorInput(value!, 10, 20, AppLang.email);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButtonAuth(
                      textbtn: AppLang.check.tr,
                      onPressed: () => controller.checkEmail(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ]),
                ),
              ),
            ));
      }),
    );
  }
}
