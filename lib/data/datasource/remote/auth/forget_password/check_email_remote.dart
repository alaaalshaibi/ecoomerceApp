import 'package:e_commerce_app/app_link.dart';
import 'package:e_commerce_app/core/class/crud.dart';

class CheckEmailRemoteData {
  Crud crud;
  CheckEmailRemoteData({
    required this.crud,
  });

  checkEmailPostData(String email) async {
    var response =
        await crud.postData(AppLink.checkEmail, {"users_email": email});
    return response.fold((l) => l, (r) => r);
  }
}
