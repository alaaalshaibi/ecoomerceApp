import 'package:e_commerce_app/core/class/crud.dart';
import 'package:e_commerce_app/app_link.dart';

class FavoriteData {
  Crud crud;
  FavoriteData({
    required this.crud,
  });
  favoriteViewData({required String userId}) async {
    var response = await crud.postData(AppLink.viewFavorite, {
      "users_id": userId,
    });
    return response.fold((l) => l, (r) => r);
  }

  favoriteAddData({required String userId, required String itemsId}) async {
    var response = await crud.postData(AppLink.addFavorite, {
      "favorite_users_id": userId,
      "favorite_items_id": itemsId,
    });
    return response.fold((l) => l, (r) => r);
  }

  favoriteRemoveData({required String userId, required String itemsId}) async {
    var response = await crud.postData(AppLink.removeFavorite, {
      "favorite_users_id": userId,
      "favorite_items_id": itemsId,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeFromFavorite({required String favoriteId}) async {
    var response = await crud.postData(AppLink.removeFromFavorite, {
      "favorite_id": favoriteId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
