import 'package:e_commerce_app/app_link.dart';
import 'package:e_commerce_app/core/class/crud.dart';

class SignUpRemote {
  Crud crud;
  SignUpRemote({
    required this.crud,
  });
  postData(
      {String? userName,
      String? email,
      String? phone,
      String? password}) async {
    var response = await crud.postData(AppLink.signUp, {
      "users_name": userName,
      "users_email": email,
      "users_phone": phone,
      "users_password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
