import 'package:e_commerce_app/app_link.dart';
import 'package:e_commerce_app/core/class/crud.dart';

class VerifyCodeSignUpRemote {
  Crud crud;
  VerifyCodeSignUpRemote({
    required this.crud,
  });

  postData(String userEmail, String verifyCodeUser) async {
    var response = await crud.postData(AppLink.verifyCode, {
      "users_email": userEmail,
      "verify_typing": verifyCodeUser,
    });
    return response.fold((l) => l, (r) => r);
  }
}
