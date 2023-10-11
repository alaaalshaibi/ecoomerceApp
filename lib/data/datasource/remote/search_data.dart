import 'package:e_commerce_app/core/class/crud.dart';
import 'package:e_commerce_app/app_link.dart';

class SearchData {
  Crud crud;
  SearchData({
    required this.crud,
  });
  searchData({required String searchItems}) async {
    var response =
        await crud.postData(AppLink.searchItems, {"items_name": searchItems});
    return response.fold((l) => l, (r) => r);
  }
}
