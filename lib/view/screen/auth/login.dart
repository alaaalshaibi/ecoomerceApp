import 'package:e_commerce_app/controller/auth/login_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/core/functions/alert_exit.dart';
import 'package:e_commerce_app/core/functions/validator_input.dart';
import 'package:e_commerce_app/core/localization/app_text_lang.dart';
import 'package:e_commerce_app/view/widget/auth/custom_body_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_button_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_logo_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_text_bottom_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_text_form_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: AppBar(
        title: Text(
          AppLang.login.tr,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.grey),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: AppColor.backgroundcolor,
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(builder: (controller) {
          return HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                child: Form(
                  key: controller.keyForm,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      const Logo(),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTitleAuth(titleText: AppLang.welcomeBack.tr),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomBodyAuth(
                        bodyText: AppLang.textLogin.tr,
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
                          return validatorInput(value!, 5, 30, AppLang.email);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GetBuilder<LoginControllerImp>(builder: (controller) {
                        return CustomTextFormAuth(
                          obscureText: controller.obscure,
                          suffixOnPressed: () => controller.showPassword(),
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
                        height: 10,
                      ),
                      InkWell(
                        onTap: () => controller.goToForgetPassword(),
                        child: Text(
                          AppLang.forGetPassword.tr,
                          style: const TextStyle(
                              decoration: TextDecoration.underline),
                          textAlign: TextAlign.end,
                        ),
                      ),
                      CustomButtonAuth(
                        textbtn: AppLang.login.tr,
                        onPressed: () => controller.login(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextBottomAuth(
                          fText: AppLang.doNotHaveAcc.tr,
                          lText: AppLang.signUp.tr,
                          onTap: () => controller.goToSignUp())
                    ]),
                  ),
                ),
              ));
        }),
      ),
    );
  }
}
