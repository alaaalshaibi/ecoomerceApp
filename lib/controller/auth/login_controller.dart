import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/routes_name.dart';
import 'package:e_commerce_app/core/functions/handling_status_controller.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/datasource/remote/auth/login_remote.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
  showPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passWordController;
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  LoginRemoteData loginRemoteData = LoginRemoteData(crud: Get.find());
  bool obscure = false;
  @override
  login() async {
    if (keyForm.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginRemoteData.postDataLogin(
          emailController.text, passWordController.text);
      statusRequest = handlingStatusRequest(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          myServices.sharedPreferences
              .setString("id", response['data']['users_id']);
          myServices.sharedPreferences
              .setString("username", response['data']['users_name']);
          myServices.sharedPreferences
              .setString("email", response['data']['users_email']);
          myServices.sharedPreferences
              .setString("phone", response['data']['users_phone']);
          myServices.sharedPreferences.setString("step", "2");
          Get.offNamed(AppRoute.homePage);
          update();
        } else {
          Get.defaultDialog(
            middleText: 'Email or Phone Note correct',
            onCancel: () => Get.back(),
          );
          statusRequest = StatusRequest.failure;
          update();
        }
      } else {
        // Get.defaultDialog(
        //   middleText: 'Email or Phone Note correct',
        //   onCancel: () => Get.back(),
        // );
        statusRequest = StatusRequest.failure;
        update();
      }
    } else {
      return 'Not Valid Login';
    }
  }

  @override
  goToSignUp() {
    Get.toNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print("=============================");
      print("Firebase Token: $value");
      String? token = value;
    });
    emailController = TextEditingController();
    passWordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passWordController.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.offNamed(AppRoute.forgetPassword);
  }

  @override
  showPassword() {
    obscure = obscure == false ? true : false;
    update();
  }
}
