import 'package:e_commerce_app/core/constant/routes_name.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordController extends GetxController {
  goToLogin();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  goToLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
