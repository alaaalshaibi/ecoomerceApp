class ItemModel {
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

  ItemModel(
      {this.itemsId,
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

  ItemModel.fromJson(Map<String, dynamic> json) {
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
