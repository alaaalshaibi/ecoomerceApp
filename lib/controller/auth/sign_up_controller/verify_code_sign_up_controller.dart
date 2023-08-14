import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/routes_name.dart';
import 'package:e_commerce_app/core/functions/handling_status_controller.dart';
import 'package:e_commerce_app/data/datasource/remote/auth/verify_code_sign_up_remote.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode(String verificationCode);
  goToSuccessCheckEmailSignUp();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  //late String verifyCode;
  late String userEmail;
  VerifyCodeSignUpRemote verifyCodeSignUpRemote =
      VerifyCodeSignUpRemote(crud: Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  @override
  checkCode(verificationCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verifyCodeSignUpRemote.postData(userEmail, verificationCode);
    statusRequest = handlingStatusRequest(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        goToSuccessCheckEmailSignUp();
      } else {
        Get.defaultDialog(
          middleText: 'not Valid Verify Code',
          onCancel: () => Get.back(),
        );
        statusRequest = StatusRequest.failure;
      }
    } else {
      return 'not Valid Verify Code';
    }
  }

  @override
  goToSuccessCheckEmailSignUp() {
    Get.offNamed(AppRoute.successCheckEmailSignUp);
  }

  @override
  void onInit() {
    userEmail = Get.arguments['userEmail'];
    super.onInit();
  }
}
