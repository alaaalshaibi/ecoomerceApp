import 'package:e_commerce_app/data/model/cart_model.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/user_key.dart';
import '../../core/functions/handling_status_controller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/cart.dart';

abstract class CartController extends GetxController {
  cartView();
  addCart(String itemsId);
  removeCart(String itemsId);
  resetVarCart();
  refreshPage();
}

class CartControllerImp extends CartController {
  CartData cartData = CartData(crud: Get.find());
  MyServices myServices = Get.find();
  List<CartModel> cartList = [];
  Map isFavorite = {};
  int itemCount = 0;
  double totalPriceOrder = 0.0;
  int countTotal = 0;
  StatusRequest statusRequest = StatusRequest.none;
  @override
  resetVarCart() {
    totalPriceOrder = 0.0;
    countTotal = 0;
    cartList.clear();
  }

  @override
  refreshPage() {
    resetVarCart();
    cartView();
  }

  @override
  cartView() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.cartViewData(
      userId: myServices.sharedPreferences.getString(UserKey.idUser)!,
    );
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List responseList = response['dataCart'];
        Map responseCountPrice = response['totalCountPrice'];
        cartList.addAll(responseList.map((e) => CartModel.fromJson(e)));
        totalPriceOrder = double.parse(responseCountPrice['totalPriceOrder']);
        countTotal = int.parse(responseCountPrice['countTotal']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  addCart(String itemsId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.cartAddData(
        userId: myServices.sharedPreferences.getString(UserKey.idUser)!,
        itemsId: itemsId);
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(title: "notification", message: "add to cart");
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  removeCart(String itemsId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.cartRemoveData(
        userId: myServices.sharedPreferences.getString(UserKey.idUser)!,
        itemsId: itemsId);
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.rawSnackbar(title: "notification", message: "remove to cart");
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void onInit() {
    cartView();
    super.onInit();
  }
}
