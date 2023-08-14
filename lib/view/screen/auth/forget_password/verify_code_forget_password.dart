import 'package:e_commerce_app/controller/auth/forget_password_controller/verify_code_controller.dart';
import 'package:e_commerce_app/core/class/handling_data_view.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/view/widget/auth/custom_body_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_title_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCodeForgetPassword extends StatelessWidget {
  const VerifyCodeForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: AppBar(
        title: Text(
          'verification Code ',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.grey),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: AppColor.backgroundcolor,
      ),
      body: SingleChildScrollView(
        child: GetBuilder<VerifyCodeControllerImp>(builder: (controller) {
          return HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                child: Column(children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const CustomTitleAuth(titleText: 'Check Code'),
                  const SizedBox(
                    height: 15,
                  ),
                  const CustomBodyAuth(
                    bodyText: 'Please Enter The Digit Code Sent To Your Email',
                  ),
                  const SizedBox(
                    height: 65,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  OtpTextField(
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
                    onSubmit: (String verifyCodeTyping) {
                      controller.checkCode(verifyCodeTyping);
                    }, // end onSubmit
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ]),
              ));
        }),
      ),
    );
  }
}
