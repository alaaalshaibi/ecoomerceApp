import 'package:e_commerce_app/core/class/crud.dart';
import 'package:e_commerce_app/app_link.dart';

class CartData {
  Crud crud;
  CartData({
    required this.crud,
  });

  cartViewData({required String userId}) async {
    var response = await crud.postData(AppLink.cartView, {
      "cart_users_id": userId,
    });
    return response.fold((l) => l, (r) => r);
  }

  cartAddData({required String userId, required String itemsId}) async {
    var response = await crud.postData(AppLink.cartAdd, {
      "cart_users_id": userId,
      "cart_items_id": itemsId,
    });
    return response.fold((l) => l, (r) => r);
  }

  cartRemoveData({required String userId, required String itemsId}) async {
    var response = await crud.postData(AppLink.cartRemove, {
      "cart_users_id": userId,
      "cart_items_id": itemsId,
    });
    return response.fold((l) => l, (r) => r);
  }

  cartItemCountData({required String userId, required String itemsId}) async {
    var response = await crud.postData(AppLink.cartItemCount, {
      "cart_users_id": userId,
      "cart_items_id": itemsId,
    });
    return response.fold((l) => l, (r) => r);
  }

  checkCouponData({required String couponName}) async {
    var response = await crud.postData(AppLink.checkCoupon, {
      "coupon_name": couponName,
    });
    return response.fold((l) => l, (r) => r);
  }
}
