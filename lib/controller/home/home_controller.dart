import 'package:e_commerce_app/core/constant/routes_name.dart';
import 'package:e_commerce_app/core/constant/user_key.dart';
import 'package:e_commerce_app/data/datasource/remote/home_data.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/functions/handling_status_controller.dart';
import '../items/search.dart';

abstract class HomeController extends SearchControllerImp {
  initialData();
  getDataHome();
  goToItemsPage(List categories, int isSelectedCat, String idCategories);
}

class HomeControllerImp extends HomeController {
  HomeData homeData = HomeData(crud: Get.find());
  late String idUser;
  late String userName;
  List items = [];
  List categories = [];

  @override
  initialData() {
    idUser = myServices.sharedPreferences.getString(UserKey.idUser)!;
    userName = myServices.sharedPreferences.getString(UserKey.userName)!;
  }

  @override
  getDataHome() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    statusRequest = handlingStatusRequest(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        categories.addAll(response['categories']);
        items.addAll(response['items']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getDataHome();
    initialData();
    super.onInit();
  }

  @override
  goToItemsPage(List categories, int isSelectedCat, String idCategories) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "isSelectedCat": isSelectedCat,
      "idCategories": idCategories,
    });
  }
}
