import 'package:e_commerce_app/core/constant/user_key.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/datasource/remote/orders_data.dart';
import 'package:e_commerce_app/data/model/orders_model.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/functions/handling_status_controller.dart';

abstract class OrderArchiveController extends GetxController {
  getOrderArchive();
  changeMethodStatus(String value);
  changePaymentMethodType(String value);
  changeOrderType(String value);
  sendRating(
      {required String orderId,
      required String rating,
      required String noteRating});
}

class OrderArchiveControllerImp extends OrderArchiveController {
  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;
  OrdersData ordersData = OrdersData(crud: Get.find());
  List<OrdersModel> listOrderArchive = [];

  @override
  void onInit() {
    getOrderArchive();
    super.onInit();
  }

  @override
  changeOrderType(String value) {
    if (value == '1') {
      // orderType = 'Receive';
      return 'Receive';
    } else {
      // orderType = 'Delivery';
      return 'Delivery';
    }
    // update();
  }

  @override
  changePaymentMethodType(String value) {
    if (value == '1') {
      // return  orderPaymentMethodType = 'Card';
      return 'Card';
    } else {
      // return  orderPaymentMethodType = 'Cash';
      return 'Cash';
    }
    // update();
  }

  @override
  changeMethodStatus(String value) {
    if (value == '0') {
      return "Pending Approval";
    } else if (value == '1') {
      return 'The order is benign prepared';
    } else if (value == '2') {
      return 'On The Way';
    } else {
      return "Archive";
    }
    // update();
  }

  @override
  getOrderArchive() async {
    listOrderArchive.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.orderArchiveData(
        userId: myServices.sharedPreferences.getString(UserKey.idUser)!);
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        listOrderArchive
            .addAll(responseData.map((e) => OrdersModel.fromJson(e)));
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void sendRating(
      {required String orderId,
      required String rating,
      required String noteRating}) async {
    if (noteRating.isEmpty) {
      noteRating = "none";
    }
    var response = await ordersData.orderRatingData(
      userId: myServices.sharedPreferences.getString(UserKey.idUser)!,
      orderId: orderId,
      rating: rating.toString(),
      noteRating: noteRating,
    );
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        getOrderArchive();
      }
    }
  }
}
