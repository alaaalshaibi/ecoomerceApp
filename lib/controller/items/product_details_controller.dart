import 'package:e_commerce_app/core/constant/routes_name.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/datasource/remote/cart.dart';
import 'package:e_commerce_app/data/model/items_model.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/user_key.dart';
import '../../core/functions/handling_status_controller.dart';

abstract class ProductDetailsController extends GetxController {
  initData();
  itemsAdd(String itemsId);
  itemsRemove(String itemsId);
  getItemCountCart(String itemsId);
  goToCart();
  isDiscount();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  // CartControllerImp cartControllerImp = Get.put(CartControllerImp());
  MyServices myServices = Get.find();
  CartData cartData = CartData(crud: Get.find());
  late ItemsModel itemsModel;
  StatusRequest statusRequest = StatusRequest.none;
  int itemCountCart = 0;
  bool isDis = false;
  List subItems = [
    {"name": "Red", "id": 1, "isActive": 0},
    {"name": "Blue", "id": 2, "isActive": 1},
    {"name": "Black", "id": 3, "isActive": 0},
  ];
  @override
  void onInit() {
    initData();
    isDiscount();
    super.onInit();
  }

  @override
  initData() async {
    itemsModel = Get.arguments["itemsModel"];
    itemCountCart = await getItemCountCart(itemsModel.itemsId!);
    update();
  }

  @override
  getItemCountCart(String itemsId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.cartItemCountData(
        userId: myServices.sharedPreferences.getString(UserKey.idUser)!,
        itemsId: itemsId);
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        itemCountCart = int.parse(response['data']);
        return itemCountCart;
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  itemsAdd(itemsId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.cartAddData(
        userId: myServices.sharedPreferences.getString(UserKey.idUser)!,
        itemsId: itemsId);
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.snackbar("notification", "add to cart");
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    itemCountCart++;
    update();
  }

  @override
  itemsRemove(itemsId) async {
    if (itemCountCart > 0) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await cartData.cartRemoveData(
          userId: myServices.sharedPreferences.getString(UserKey.idUser)!,
          itemsId: itemsId);
      statusRequest = handlingStatusRequest(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          Get.snackbar("notification", "remove to cart");
        } else {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      itemCountCart--;
      update();
    }
  }

  @override
  goToCart() {
    Get.toNamed(AppRoute.cartScreen);
  }

  @override
  isDiscount() {
    if (itemsModel.itemsDiscount == "0") {
      isDis = false;
      update();
    } else {
      isDis = true;
      update();
    }
  }
}
