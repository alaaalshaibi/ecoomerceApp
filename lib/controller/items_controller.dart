import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/routes_name.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/model/items_model.dart';
import 'package:get/get.dart';

import '../core/constant/user_key.dart';
import '../core/functions/handling_status_controller.dart';
import '../data/datasource/remote/items_view.dart';

abstract class ItemsController extends GetxController {
  initData();
  changeTabCat(int indexTab, String idCatagories);
  getItemsView(String idCategories);
  goToProductDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends ItemsController {
  ItemsViewData itemsViewData = ItemsViewData(crud: Get.find());
  MyServices myServices = Get.find();
  List catagoriesItems = [];
  int? isSelected;
  String? idCat;
  List itemsView = [];
  StatusRequest statusRequest = StatusRequest.none;
  late String idCategories;
  @override
  initData() {
    catagoriesItems = Get.arguments['categories'];
    isSelected = Get.arguments['isSelectedCat'];
    idCategories = Get.arguments['idCategories'];
  }

  @override
  void onInit() {
    initData();
    getItemsView(idCategories);
    super.onInit();
  }

  @override
  void onClose() {
    itemsView.clear();
    super.onClose();
  }

  @override
  changeTabCat(int indexTab, String idCatagories) {
    isSelected = indexTab;
    idCat = idCatagories;
    update();
    getItemsView(idCat!);
  }

  @override
  getItemsView(String idCategories) async {
    itemsView.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsViewData.getDataItemsView(
      usersId: myServices.sharedPreferences.getString(UserKey.idUser)!,
      idCatagories: idCategories,
    );
    statusRequest = handlingStatusRequest(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        itemsView.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToProductDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoute.productDetailsScreen,
        arguments: {"itemsModel": itemsModel});
  }
}
