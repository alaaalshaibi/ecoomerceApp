import 'dart:io';

import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/routes_name.dart';
import 'package:e_commerce_app/core/constant/user_key.dart';
import 'package:e_commerce_app/core/functions/handling_status_controller.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/datasource/remote/auth/login_remote.dart';
import 'package:e_commerce_app/data/model/auth_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
  showPassword();
  goToVerifyCodeSignUp();
  alertExit(bool value);
}

class LoginControllerImp extends LoginController {
  bool canPop = false;
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  List<AuthModel> auth = [];
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
          if (response['message'] == 'please verify code') {
            goToVerifyCodeSignUp();
          } else {
            auth.add(AuthModel.fromJson(response['data']));
            myServices.sharedPreferences
                .setString(UserKey.idUser, response['data']['users_id']);
            myServices.sharedPreferences
                .setString(UserKey.userName, response['data']['users_name']);
            myServices.sharedPreferences
                .setString(UserKey.email, response['data']['users_email']);
            myServices.sharedPreferences
                .setString(UserKey.phone, response['data']['users_phone']);
            // String userId =
            //     myServices.sharedPreferences.getString(UserKey.idUser)!;
            myServices.sharedPreferences.setString("Login", "2");
            FirebaseMessaging.instance.subscribeToTopic("users");
            FirebaseMessaging.instance.subscribeToTopic(
                "users${myServices.sharedPreferences.getString(UserKey.idUser)}");
            Get.offNamed(AppRoute.homePage);
            update();
          }
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
      print("Firebase Token: $value");
      //String? token = value;
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
    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  showPassword() {
    obscure = obscure == false ? true : false;
    update();
  }

  @override
  goToVerifyCodeSignUp() {
    Get.offNamed(AppRoute.verifyCodeSignUp, arguments: {
      "userEmail": emailController.text,
    });
  }

  @override
  bool alertExit(bool value) {
    Get.defaultDialog(
      title: 'Alert',
      middleText: 'Do you want to exit the application',
      onConfirm: () => exit(0),
      onCancel: () => Get.back(),
    );
    return false;
  }
}
