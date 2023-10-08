class CartModel {
  String? totalItemsPrice;
  String? itemsCountCart;
  String? cartId;
  String? cartUsersId;
  String? cartItemsId;
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDescription;
  String? itemsDescriptionAr;
  String? itemsImage;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsDatetime;
  String? itemsCategories;

  CartModel(
      {this.totalItemsPrice,
      this.itemsCountCart,
      this.cartId,
      this.cartUsersId,
      this.cartItemsId,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDescription,
      this.itemsDescriptionAr,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDatetime,
      this.itemsCategories});

  CartModel.fromJson(Map<String, dynamic> json) {
    totalItemsPrice = json['totalItemsPrice'];
    itemsCountCart = json['itemsCountCart'];
    cartId = json['cart_id'];
    cartUsersId = json['cart_users_id'];
    cartItemsId = json['cart_items_id'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDescription = json['items_description'];
    itemsDescriptionAr = json['items_description_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDatetime = json['items_datetime'];
    itemsCategories = json['items_categories'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalItemsPrice'] = totalItemsPrice;
    data['itemsCountCart'] = itemsCountCart;
    data['cart_id'] = cartId;
    data['cart_users_id'] = cartUsersId;
    data['cart_items_id'] = cartItemsId;
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['items_name_ar'] = itemsNameAr;
    data['items_description'] = itemsDescription;
    data['items_description_ar'] = itemsDescriptionAr;
    data['items_image'] = itemsImage;
    data['items_count'] = itemsCount;
    data['items_active'] = itemsActive;
    data['items_price'] = itemsPrice;
    data['items_discount'] = itemsDiscount;
    data['items_datetime'] = itemsDatetime;
    data['items_categories'] = itemsCategories;
    return data;
  }
}
