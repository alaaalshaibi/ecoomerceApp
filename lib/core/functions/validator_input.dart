import 'package:e_commerce_app/core/localization/app_text_lang.dart';
import 'package:get/get.dart';

validatorInput(String value, int min, int max, String type) {
  String trimValue = value.trim();
  if (trimValue.isEmpty) {
    return 'It must not be empty';
  }
  if (trimValue.length < min) {
    return 'It should not be less $min';
  }
  if (trimValue.length > max) {
    return 'It should not be greater $max';
  }
  if (type == AppLang.userName) {
    if (!GetUtils.isUsername(trimValue)) {
      return 'Not Valid User Name';
    }
  }
  if (type == AppLang.email) {
    if (!GetUtils.isEmail(trimValue)) {
      return 'Not Valid Email';
    }
  }
  if (type == AppLang.password) {}
  if (type == AppLang.phone) {
    if (!GetUtils.isPhoneNumber(trimValue)) {
      return 'Not Valid Phone Number';
    }
  }
}
