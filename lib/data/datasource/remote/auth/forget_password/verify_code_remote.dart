import 'package:e_commerce_app/app_link.dart';
import 'package:e_commerce_app/core/class/crud.dart';

class VerifyCodeForGetRemoteData {
  Crud crud;
  VerifyCodeForGetRemoteData({
    required this.crud,
  });

  verifyCodeForGetPostData(String email, String verifyCodeTyping) async {
    var response = await crud.postData(AppLink.verifyCodeForGet,
        {"users_email": email, "verify_typing": verifyCodeTyping});
    return response.fold((l) => l, (r) => r);
  }
}
