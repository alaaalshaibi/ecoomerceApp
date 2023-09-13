import 'package:e_commerce_app/controller/auth/sign_up_controller/verify_code_sign_up_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/core/localization/app_text_lang.dart';
import 'package:e_commerce_app/view/widget/auth/custom_body_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: AppBar(
        title: Text(
          AppLang.checkEmail.tr,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.grey),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: AppColor.backgroundcolor,
      ),
      body: GetBuilder<VerifyCodeSignUpControllerImp>(builder: (controller) {
        return HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
              child: ListView(children: [
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
                OtpTextField(
                  autoFocus: true,
                  fieldWidth: 50,
                  borderRadius: BorderRadius.circular(20),
                  numberOfFields: 5,
                  borderColor: const Color(0xFF512DA8),
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    controller.checkCode(verificationCode);
                  }, // end onSubmit
                ),
              ]),
            ));
      }),
    );
  }
}
