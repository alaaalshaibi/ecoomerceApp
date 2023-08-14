import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/routes_name.dart';
import 'package:e_commerce_app/core/functions/handling_status_controller.dart';
import 'package:e_commerce_app/data/datasource/remote/auth/forget_password/verify_code_remote.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode(String verifyCodeTyping);
  goToResetPassword();
}

class VerifyCodeControllerImp extends VerifyCodeController {
  VerifyCodeForGetRemoteData verifyCodeForGetRemoteData =
      VerifyCodeForGetRemoteData(crud: Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  late String email;

  @override
  checkCode(verifyCodeTyping) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeForGetRemoteData.verifyCodeForGetPostData(
        email, verifyCodeTyping);
    statusRequest = handlingStatusRequest(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        goToResetPassword();
      } else {
        Get.defaultDialog(
          middleText: "Not Found Email",
          onCancel: () => Get.back(),
        );
        statusRequest = StatusRequest.failure;
      }
    } else {
      return 'not Valid Verify Code';
    }
    update();
  }

  @override
  goToResetPassword() {
    Get.offNamed(AppRoute.resetPassword, arguments: {'users_email': email});
  }

  @override
  void onInit() {
    email = Get.arguments['users_email'];
    super.onInit();
  }
  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
