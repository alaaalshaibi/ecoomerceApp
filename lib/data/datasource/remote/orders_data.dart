import '../../../app_link.dart';
import '../../../core/class/crud.dart';

class OrdersData {
  Crud crud;
  OrdersData({
    required this.crud,
  });
  orderPendingData({required String userId}) async {
    var response = await crud.postData(AppLink.orderPending, {
      "orders_users_id": userId,
    });
    return response.fold((l) => l, (r) => r);
  }

  orderArchiveData({required String userId}) async {
    var response = await crud.postData(AppLink.ordersArchive, {
      "orders_users_id": userId,
    });
    return response.fold((l) => l, (r) => r);
  }

  orderDetailsData({required String ordersId}) async {
    var response = await crud.postData(AppLink.ordersDetails, {
      "orders_id": ordersId,
    });
    return response.fold((l) => l, (r) => r);
  }

  orderDeleteData({required String ordersId}) async {
    var response = await crud.postData(AppLink.ordersDelete, {
      "orders_id": ordersId,
    });
    return response.fold((l) => l, (r) => r);
  }

  orderRatingData({
    required String userId,
    required String orderId,
    required String rating,
    required String noteRating,
  }) async {
    var response = await crud.postData(AppLink.rating, {
      "orders_users_id": userId,
      "orders_id": orderId,
      "orders_rating": rating,
      "orders_note_rating": noteRating,
    });
    return response.fold((l) => l, (r) => r);
  }
}
