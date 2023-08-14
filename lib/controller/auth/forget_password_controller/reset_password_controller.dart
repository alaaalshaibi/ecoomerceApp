import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/routes_name.dart';
import 'package:e_commerce_app/core/functions/handling_status_controller.dart';
import 'package:e_commerce_app/data/datasource/remote/auth/forget_password/reset_password_remote.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  goToSuccessResetPassword();
  showPassword();
  showRePassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController passwordController;
  late TextEditingController rePasswordController;
  late String email;
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  ResetPasswordRemoteData resetPasswordRemoteData =
      ResetPasswordRemoteData(crud: Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  bool obscure = false;
  bool obscureRePass = false;

  @override
  resetPassword() async {
    if (rePasswordController.text != passwordController.text) {
      return Get.defaultDialog(
        middleText: "The password does not match",
        onCancel: () => Get.back(),
      );
    }
    if (keyForm.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordRemoteData.resetPasswordPostData(
          email, rePasswordController.text);
      statusRequest = handlingStatusRequest(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          goToSuccessResetPassword();
        } else {
          Get.defaultDialog(
            middleText: "not Valid resetPassword",
            onCancel: () => Get.back(),
          );
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      return 'not Valid resetPassword';
    }
  }

  @override
  goToSuccessResetPassword() {
    Get.offNamed(AppRoute.successResetPassword);
  }

  @override
  void onInit() {
    email = Get.arguments['users_email'];
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    passwordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }

  @override
  showPassword() {
    obscure = obscure == false ? true : false;
    update();
  }

  @override
  showRePassword() {
    obscure = obscure == false ? true : false;
    update();
  }
}
