import 'package:e_commerce_app/core/class/crud.dart';
import 'package:e_commerce_app/app_link.dart';

class ItemsViewData {
  Crud crud;
  ItemsViewData({
    required this.crud,
  });
  getDataItemsView(
      {required String idCatagories, required String usersId}) async {
    var response = await crud.postData(AppLink.itemsView,
        {"users_id": usersId, "categories_id": idCatagories});
    return response.fold((l) => l, (r) => r);
  }
}
