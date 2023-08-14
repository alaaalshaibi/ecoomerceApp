import 'package:e_commerce_app/core/constant/routes_name.dart';
import 'package:get/get.dart';

abstract class SuccessCheckEmailController extends GetxController {
  goToLogin();
}

class SuccessCheckEmailControllerImp extends SuccessCheckEmailController {
  @override
  goToLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
