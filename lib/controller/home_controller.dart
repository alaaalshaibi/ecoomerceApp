import 'package:e_commerce_app/core/services/services.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {}

class HomeControllerImp extends HomeController {
  String? userName;
  MyServices myServices = Get.find();
  initialData() {
    userName = myServices.sharedPreferences.getString('email');
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
