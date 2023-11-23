import 'package:e_commerce_app/data/datasource/remote/orders_data.dart';
import 'package:e_commerce_app/data/model/orders_model.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/user_key.dart';
import '../../core/functions/handling_status_controller.dart';
import '../../core/services/services.dart';

abstract class OrdersController extends GetxController {
  getOrdersPending();
  changeOrderType(String value);
  changePaymentMethodType(String value);
  changeMethodStatus(String value);
  refreshOrderPending();
  deleteOrder(String ordersId);
}

class OrdersControllerImp extends OrdersController {
  OrdersData ordersData = OrdersData(crud: Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  List<OrdersModel> orderPending = [];
  String orderType = 'Delivery';
  String orderPaymentMethodType = 'cash';
  @override
  getOrdersPending() async {
    orderPending.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.orderPendingData(
        userId: myServices.sharedPreferences.getString(UserKey.idUser)!);
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        orderPending.addAll(responseData.map((e) => OrdersModel.fromJson(e)));
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void onInit() {
    getOrdersPending();
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
  refreshOrderPending() {
    getOrdersPending();
  }

  @override
  deleteOrder(String ordersId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.orderDeleteData(ordersId: ordersId);
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        refreshOrderPending();
        Get.snackbar("Alert", 'The Delete Order');
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }
}
