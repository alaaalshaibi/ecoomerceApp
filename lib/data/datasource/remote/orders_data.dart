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
}
