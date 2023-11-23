import 'dart:async';

import 'package:e_commerce_app/data/datasource/remote/orders_data.dart';
import 'package:e_commerce_app/data/model/cart_model.dart';
import 'package:e_commerce_app/data/model/orders_model.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/class/status_request.dart';
import '../../core/functions/handling_status_controller.dart';

abstract class OrderDetailsController extends GetxController {
  initData();
  getOrderDetails();
}

class OrderDetailsControllerImp extends OrderDetailsController {
  late OrdersModel ordersModel;
  Completer<GoogleMapController> controllerMap =
      Completer<GoogleMapController>();
  late CameraPosition cameraPosition;
  List<Marker> marker = [];
  double? lat;
  double? lang;
  StatusRequest statusRequest = StatusRequest.none;
  OrdersData ordersData = OrdersData(crud: Get.find());
  List<CartModel> listOrderDetails = [];
  @override
  initData() {
    ordersModel = Get.arguments['ordersModel'];
    getOrderDetails();
    if (ordersModel.ordersAddress != '0') {
      cameraPosition = CameraPosition(
        target: LatLng(double.parse(ordersModel.addressLat!),
            double.parse(ordersModel.addressLang!)),
        zoom: 11.4746,
      );
      marker.add(Marker(
        markerId: const MarkerId('1'),
        position: LatLng(double.parse(ordersModel.addressLat!),
            double.parse(ordersModel.addressLang!)),
      ));
    }
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  getOrderDetails() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await ordersData.orderDetailsData(ordersId: ordersModel.ordersId!);
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List responseData = response['data'];
        listOrderDetails.addAll(responseData.map((e) => CartModel.fromJson(e)));
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }
}
