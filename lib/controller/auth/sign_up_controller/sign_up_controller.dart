import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/routes_name.dart';
import 'package:e_commerce_app/core/functions/handling_status_controller.dart';
import 'package:e_commerce_app/data/datasource/remote/auth/sign_up_remote.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToVerifyCodeSignUp();
  goToLogin();
  showPassword();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController userNameController;
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;
  late TextEditingController passWordController;
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  bool obscure = false;
  SignUpRemote signUpRemote = SignUpRemote(crud: Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  @override
  signUp() async {
    if (keyForm.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpRemote.postData(
        userName: userNameController.text,
        email: emailController.text,
        phone: phoneNumberController.text,
        password: passWordController.text,
      );
      statusRequest = handlingStatusRequest(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          goToVerifyCodeSignUp();
        } else {
          Get.defaultDialog(
            middleText: 'User already exists (Email or Phone)',
            onCancel: () => Get.back(),
          );
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      return 'not Valid signUp';
    }
  }

  @override
  goToLogin() {
    Get.offAllNamed(AppRoute.login);
  }

  @override
  goToVerifyCodeSignUp() {
    Get.offNamed(AppRoute.verifyCodeSignUp, arguments: {
      "userEmail": emailController.text,
    });
  }

  @override
  void onInit() {
    userNameController = TextEditingController();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
    passWordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passWordController.dispose();
    super.dispose();
  }

  @override
  showPassword() {
    obscure = obscure == false ? true : false;
    update();
  }
}
