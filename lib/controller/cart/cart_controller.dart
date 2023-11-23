import 'package:e_commerce_app/data/model/cart_model.dart';
import 'package:e_commerce_app/data/model/coupon_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/routes_name.dart';
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
  checkCoupon();
  checkEnabled();
  getTotalPrice();
  goToCheckOut();
}

class CartControllerImp extends CartController {
  TextEditingController couponController = TextEditingController();
  CartData cartData = CartData(crud: Get.find());
  MyServices myServices = Get.find();
  List<CartModel> cartList = [];
  Map isFavorite = {};
  int itemCount = 0;
  double totalPriceOrder = 0.0;
  int countTotal = 0;
  bool isEnabledCouponCont = true;
  CouponModel? couponModel;
  double discountCoupon = 0.0;
  String? couponName;
  String? couponId;
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
  goToCheckOut() {
    if (cartList.isEmpty) return Get.snackbar('alert', 'My Cart Is Empty');
    Get.toNamed(AppRoute.checkOut, arguments: {
      'couponId': couponId ?? '0',
      'priceOrder': totalPriceOrder.toString(),
      'discountCoupon': discountCoupon.toString(),
    });
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
        Get.snackbar("notification", "add to cart");
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
        Get.snackbar("notification", "remove to cart");
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
    couponController = TextEditingController();
    cartView();
    super.onInit();
  }

  @override
  void dispose() {
    couponController.dispose();
    super.dispose();
  }

  @override
  checkCoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.checkCouponData(couponName: couponController.text);
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        checkEnabled();
        Map<String, dynamic> couponResponse = response['data'];
        couponModel = CouponModel.fromJson(couponResponse);
        discountCoupon = double.parse(couponModel!.couponDiscount!);
        couponName = couponModel!.couponName;
        couponId = couponModel!.couponId;
      } else {
        // statusRequest = StatusRequest.failure;
        Get.snackbar('Alert', 'The coupon not valid');
        discountCoupon = 0.0;
        couponName = null;
      }
    } else {
      // statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  checkEnabled() {
    isEnabledCouponCont = false;
    update();
  }

  @override
  getTotalPrice() {
    return (totalPriceOrder - (totalPriceOrder * discountCoupon / 100));
  }
}
