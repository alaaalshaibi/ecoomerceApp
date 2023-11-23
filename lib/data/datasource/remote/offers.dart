import 'package:e_commerce_app/core/class/crud.dart';
import 'package:e_commerce_app/app_link.dart';

class OffersData {
  Crud crud;
  OffersData({
    required this.crud,
  });
  getData({required String userId}) async {
    var response = await crud.postData(AppLink.offers, {"users_id": userId});
    return response.fold((l) => l, (r) => r);
  }
}
