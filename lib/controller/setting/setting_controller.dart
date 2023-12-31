import 'package:e_commerce_app/core/constant/routes_name.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../../core/constant/user_key.dart';

abstract class SettingController extends GetxController {
  logout();
}

class SettingControllerImp extends SettingController {
  MyServices myServices = Get.find();
  @override
  logout() {
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic(
        "users${myServices.sharedPreferences.getString(UserKey.idUser)}");
    myServices.sharedPreferences.remove(UserKey.idUser);
    myServices.sharedPreferences.remove(UserKey.userName);
    myServices.sharedPreferences.remove(UserKey.email);
    myServices.sharedPreferences.remove(UserKey.phone);
    myServices.sharedPreferences.remove("Login");
    Get.offNamed(AppRoute.login);
    update();
  }
}
