import 'package:e_commerce_app/controller/auth/sign_up_controller/sign_up_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/core/functions/validator_input.dart';
import 'package:e_commerce_app/core/localization/app_text_lang.dart';
import 'package:e_commerce_app/view/widget/auth/custom_body_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_button_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_text_bottom_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_text_form_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        title: Text(
          AppLang.signUp.tr,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.grey),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: AppColor.backgroundcolor,
      ),
      body: GetBuilder<SignUpControllerImp>(builder: (controller) {
        return HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: SingleChildScrollView(
              child: Form(
                key: controller.keyForm,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  child: Column(children: [
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTitleAuth(titleText: AppLang.welcomeBack.tr),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomBodyAuth(
                      bodyText: AppLang.textSignUp.tr,
                    ),
                    const SizedBox(
                      height: 65,
                    ),
                    CustomTextFormAuth(
                      hintText: AppLang.enterUserName.tr,
                      textLabel: AppLang.userName.tr,
                      suffixIcon: Icons.person_outline,
                      txtController: controller.userNameController,
                      validator: (value) {
                        return validatorInput(value!, 5, 20, AppLang.userName);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormAuth(
                      hintText: AppLang.enterEmail.tr,
                      textLabel: AppLang.email.tr,
                      keyboardType: TextInputType.emailAddress,
                      suffixIcon: Icons.email_outlined,
                      txtController: controller.emailController,
                      validator: (value) {
                        return validatorInput(value!, 10, 30, AppLang.email);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormAuth(
                      keyboardType: TextInputType.phone,
                      hintText: AppLang.enterPhone.tr,
                      textLabel: AppLang.phone,
                      suffixIcon: Icons.phone_iphone_outlined,
                      txtController: controller.phoneNumberController,
                      validator: (value) {
                        return validatorInput(value!, 10, 15, AppLang.phone);
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GetBuilder<SignUpControllerImp>(builder: (controller) {
                      return CustomTextFormAuth(
                        obscureText: controller.obscure,
                        hintText: AppLang.enterPassword.tr,
                        textLabel: AppLang.password.tr,
                        suffixIcon: Icons.lock_outline,
                        txtController: controller.passWordController,
                        validator: (value) {
                          return validatorInput(
                              value!, 5, 20, AppLang.password);
                        },
                      );
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButtonAuth(
                      textbtn: AppLang.signUp.tr,
                      onPressed: () {
                        controller.signUp();
                        //controller.goToVerifyCodeSignUp();
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextBottomAuth(
                      fText: AppLang.haveAcc.tr,
                      lText: AppLang.login.tr,
                      onTap: () => controller.goToLogin(),
                    )
                  ]),
                ),
              ),
            ));
      }),
    );
  }
}
