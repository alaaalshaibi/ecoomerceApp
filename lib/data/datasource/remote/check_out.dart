import 'package:e_commerce_app/core/class/crud.dart';
import 'package:e_commerce_app/app_link.dart';

class CheckOutData {
  Crud crud;
  CheckOutData({required this.crud});

  orderAddData({
    required String userId,
    required String userAddress,
    required String orderType,
    required String orderPriceDelivery,
    required String orderPrice,
    required String orderCoupon,
    required String orderPaymentType,
    required String discountCoupon,
  }) async {
    var response = await crud.postData(AppLink.orderAdd, {
      "orders_users_id": userId,
      "orders_address": userAddress,
      "orders_type": orderType,
      "orders_price_delivery": orderPriceDelivery,
      "orders_price": orderPrice,
      "coupon_id": orderCoupon,
      "orders_payment_type": orderPaymentType,
      "discount_coupon": discountCoupon,
    });
    return response.fold((l) => l, (r) => r);
  }
}
