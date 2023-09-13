import 'package:e_commerce_app/core/services/services.dart';
import 'package:get/get.dart';

MyServices myServices = Get.find();
translateDataBase(columnAr, columnEn) {
  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return columnAr;
  } else {
    return columnEn;
  }
}
