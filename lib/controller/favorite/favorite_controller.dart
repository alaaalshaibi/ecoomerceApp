import 'package:e_commerce_app/controller/items/search.dart';
import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/functions/handling_status_controller.dart';
import 'package:e_commerce_app/data/datasource/remote/favorite_data.dart';
import 'package:get/get.dart';

import '../../core/constant/user_key.dart';
import '../../data/model/my_favorite_model.dart';

class FavoriteController extends SearchControllerImp {
  FavoriteData favoriteData = FavoriteData(crud: Get.find());
  // MyServices myServices = Get.find();
  Map isFavorite = {};
  List<MyFavoriteModel> dataViewFavorite = [];
  // StatusRequest statusRequest = StatusRequest.none;

  setFavorite(idProduct, valueFavorite) {
    isFavorite[idProduct] = valueFavorite;
    update();
  }

  viewFavorite() async {
    dataViewFavorite.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await favoriteData.favoriteViewData(
      userId: myServices.sharedPreferences.getString(UserKey.idUser)!,
    );
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List listResponse = response['data'];
        dataViewFavorite
            .addAll(listResponse.map((e) => MyFavoriteModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  addFavorite(String itemsId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await favoriteData.favoriteAddData(
        userId: myServices.sharedPreferences.getString(UserKey.idUser)!,
        itemsId: itemsId);
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(title: "notification", message: "add to favorite");
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  removeFavorite(String itemsId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await favoriteData.favoriteRemoveData(
        userId: myServices.sharedPreferences.getString(UserKey.idUser)!,
        itemsId: itemsId);
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(title: "notification", message: "remove to favorite");
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
  }

  removeFavoriteView(String favoriteId) {
    var response = favoriteData.removeFromFavorite(favoriteId: favoriteId);
    statusRequest = handlingStatusRequest(response);
    dataViewFavorite.removeWhere((element) => element.favoriteId == favoriteId);
    update();
  }

  @override
  void onInit() {
    viewFavorite();
    super.onInit();
  }
}
