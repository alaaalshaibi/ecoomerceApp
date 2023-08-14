import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/routes_name.dart';
import 'package:e_commerce_app/core/functions/handling_status_controller.dart';
import 'package:e_commerce_app/data/datasource/remote/auth/forget_password/check_email_remote.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();
  goToVeriFyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  late TextEditingController emailController;
  CheckEmailRemoteData checkEmailRemoteData =
      CheckEmailRemoteData(crud: Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  @override
  checkEmail() async {
    if (keyForm.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await checkEmailRemoteData.checkEmailPostData(emailController.text);
      statusRequest = handlingStatusRequest(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          goToVeriFyCode();
        } else {
          Get.defaultDialog(
            middleText: "Not Found Email",
            onCancel: () => Get.back(),
          );
          statusRequest = StatusRequest.failure;
        }
        update();
      }
    } else {
      return 'not Valid forgetPassword';
    }
  }

  @override
  goToVeriFyCode() {
    Get.offNamed(AppRoute.verifyCodeForgetPassword,
        arguments: {'users_email': emailController.text});
  }

  @override
  void onInit() {
    emailController = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
