import 'dart:async';

import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/routes_name.dart';
import 'package:e_commerce_app/core/constant/user_key.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/datasource/remote/address_data.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/functions/handling_status_controller.dart';

abstract class AddressController extends GetxController {
  getCurrentPosition();
  addMarker(LatLng latLng);
  goToCompleteAddress();
  initDetailsAddress();
  addAddress();
}

class AddressControllerImp extends AddressController {
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController street = TextEditingController();
  StatusRequest statusRequest = StatusRequest.none;
  AddressData addressData = AddressData(crud: Get.find());
  MyServices myServices = Get.find();
  List dataAddress = [];
  Completer<GoogleMapController> controllerMap =
      Completer<GoogleMapController>();
  Position? position;
  CameraPosition? cameraPosition;
  List<Marker> marker = [];
  double? lat;
  double? lang;
  CameraPosition kLake = const CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  getCurrentPosition() async {
    statusRequest = StatusRequest.loading;
    position = await Geolocator.getCurrentPosition();
    cameraPosition = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );

    statusRequest = StatusRequest.none;
    update();
  }

  @override
  addMarker(LatLng latLng) {
    marker.clear();
    marker.add(Marker(markerId: const MarkerId("1"), position: latLng));
    lat = latLng.latitude;
    lang = latLng.longitude;
    update();
  }

  @override
  goToCompleteAddress() {
    if (lat != null && lang != null) {
      Get.toNamed(AppRoute.addDetailsAddress);
    } else {
      Get.snackbar('alert', 'Please choose a location from the map');
    }
  }

  @override
  initDetailsAddress() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
  }

  @override
  addAddress() async {
    if (keyForm.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addressData.addAddressData(
          userId: myServices.sharedPreferences.getString(UserKey.idUser)!,
          addressName: name.text,
          addressCity: city.text,
          addressStreet: street.text,
          addressLat: lat.toString(),
          addressLang: lang.toString());
      statusRequest = handlingStatusRequest(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          // dataAddress.add(response['data']);
          Get.snackbar("Alert", "Location has been added");
          Get.offAllNamed(AppRoute.homePage);
          // Get.offNamed(AppRoute.viewAddress);
        } else {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  @override
  void onInit() {
    getCurrentPosition();
    initDetailsAddress();
    super.onInit();
  }
}
