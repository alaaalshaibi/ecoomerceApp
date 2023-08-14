import 'package:e_commerce_app/app_link.dart';
import 'package:e_commerce_app/core/class/crud.dart';

class ResetPasswordRemoteData {
  Crud crud;
  ResetPasswordRemoteData({
    required this.crud,
  });

  resetPasswordPostData(String email, String passwordNew) async {
    var response = await crud.postData(AppLink.resetPassword,
        {"users_email": email, "users_password": passwordNew});
    return response.fold((l) => l, (r) => r);
  }
}
