class OrdersModel {
  String? ordersId;
  String? ordersUsersId;
  String? ordersAddress;
  String? ordersType;
  String? ordersPriceDelivery;
  String? ordersPrice;
  String? ordersTotalPrice;
  String? ordersCouponId;
  String? ordersPaymentType;
  String? ordersStatus;
  String? ordersRating;
  String? ordersNoteRating;
  String? ordersDateTime;
  String? addressId;
  String? addressUserId;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLang;

  OrdersModel(
      {this.ordersId,
      this.ordersUsersId,
      this.ordersAddress,
      this.ordersType,
      this.ordersPriceDelivery,
      this.ordersPrice,
      this.ordersTotalPrice,
      this.ordersCouponId,
      this.ordersPaymentType,
      this.ordersStatus,
      this.ordersRating,
      this.ordersNoteRating,
      this.ordersDateTime,
      this.addressId,
      this.addressUserId,
      this.addressName,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLang});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersUsersId = json['orders_users_id'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersPriceDelivery = json['orders_price_delivery'];
    ordersPrice = json['orders_price'];
    ordersTotalPrice = json['orders_total_price'];
    ordersCouponId = json['orders_coupon_id'];
    ordersPaymentType = json['orders_payment_type'];
    ordersStatus = json['orders_status'];
    ordersRating = json['orders_rating'];
    ordersNoteRating = json['orders_note_rating'];
    ordersDateTime = json['orders_date_time'];
    addressId = json['address_id'];
    addressUserId = json['address_user_id'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLang = json['address_lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orders_id'] = ordersId;
    data['orders_users_id'] = ordersUsersId;
    data['orders_address'] = ordersAddress;
    data['orders_type'] = ordersType;
    data['orders_price_delivery'] = ordersPriceDelivery;
    data['orders_price'] = ordersPrice;
    data['orders_total_price'] = ordersTotalPrice;
    data['orders_coupon_id'] = ordersCouponId;
    data['orders_payment_type'] = ordersPaymentType;
    data['orders_status'] = ordersStatus;
    data['orders_rating'] = ordersRating;
    data['orders_note_rating'] = ordersNoteRating;
    data['orders_date_time'] = ordersDateTime;
    data['address_id'] = addressId;
    data['address_user_id'] = addressUserId;
    data['address_name'] = addressName;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_lang'] = addressLang;
    return data;
  }
}
