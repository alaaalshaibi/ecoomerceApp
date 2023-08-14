import 'package:e_commerce_app/app_link.dart';
import 'package:e_commerce_app/core/class/crud.dart';

class LoginRemoteData {
  Crud crud;
  LoginRemoteData({
    required this.crud,
  });
  postDataLogin(
    String email,
    String password,
  ) async {
    var response = await crud.postData(
      AppLink.login,
      {
        "users_email": email,
        "users_password": password,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
