import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/datasource/remote/home_data.dart';
import 'package:get/get.dart';

import '../core/class/status_request.dart';
import '../core/functions/handling_status_controller.dart';

abstract class HomeController extends GetxController {
  initialData();
  getDataHome();
}

class HomeControllerImp extends HomeController {
  HomeData homeData = HomeData(crud: Get.find());
  late StatusRequest statusRequest;
  // List data = [];
  List categories = [];
  MyServices myServices = Get.find();
  @override
  initialData() {}

  @override
  void onInit() {
    getDataHome();
    initialData();
    super.onInit();
  }

  @override
  getDataHome() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    statusRequest = handlingStatusRequest(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        categories.addAll(response['categories']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
