import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/datasource/remote/search_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes_name.dart';
import '../../core/functions/handling_status_controller.dart';
import '../../data/model/items_model.dart';

class SearchControllerImp extends GetxController {
  SearchData searchData = SearchData(crud: Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  TextEditingController searchText = TextEditingController();

  bool isSearch = false;
  List<ItemsModel> listSearch = [];
  onChangeValue(String value) {
    if (value.isNotEmpty) {
      isSearch = true;
    } else {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  getSearchData() async {
    listSearch.clear();
    statusRequest = StatusRequest.loading;
    var response = await searchData.searchData(searchItems: searchText.text);
    statusRequest = handlingStatusRequest(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List listResponse = response['data'];
        listSearch.addAll(listResponse.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToProductDetails(ItemsModel itemsModel) {
    Get.toNamed(AppRoute.productDetailsScreen,
        arguments: {"itemsModel": itemsModel});
  }

  @override
  void onInit() {
    searchText = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    searchText = TextEditingController();
    super.dispose();
  }
}
