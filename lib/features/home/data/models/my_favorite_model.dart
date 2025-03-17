class MyFavoriteModel {
  int? favoriteId;
  int? favoriteUsersid;
  int? favoriteItemsid;
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  int? itemsCount;
  int? itemsActive;
  int? itemsPrice;
  int? itemsDiscount;
  String? itemsDate;
  int? itemsCat;
  int? usersId;
  int? itemsPriceDiscount;

  MyFavoriteModel({
    this.favoriteId,
    this.favoriteUsersid,
    this.favoriteItemsid,
    this.itemsId,
    this.itemsName,
    this.itemsNameAr,
    this.itemsDesc,
    this.itemsDescAr,
    this.itemsImage,
    this.itemsCount,
    this.itemsActive,
    this.itemsPrice,
    this.itemsDiscount,
    this.itemsDate,
    this.itemsCat,
    this.usersId,
    this.itemsPriceDiscount,
  });

  MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = int.tryParse(json['favorite_id'].toString());
    favoriteUsersid = int.tryParse(json['favorite_usersid'].toString());
    favoriteItemsid = int.tryParse(json['favorite_itemsid'].toString());
    itemsId = int.tryParse(json['items_id'].toString());
    itemsName = json['items_name'] as String?;
    itemsNameAr = json['items_name_ar'] as String?;
    itemsDesc = json['items_desc'] as String?;
    itemsDescAr = json['items_desc_ar'] as String?;
    itemsImage = json['items_image'] as String?;
    itemsCount = int.tryParse(json['items_count'].toString());
    itemsActive = int.tryParse(json['items_active'].toString());
    itemsPrice = int.tryParse(json['items_price'].toString());
    itemsDiscount = int.tryParse(json['items_discount'].toString());
    itemsDate = json['items_date'] as String?;
    itemsCat = int.tryParse(json['items_cat'].toString());
    usersId = int.tryParse(json['users_id'].toString());
    itemsPriceDiscount = int.tryParse(json['itemspricediscount'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['favorite_id'] = favoriteId;
    data['favorite_usersid'] = favoriteUsersid;
    data['favorite_itemsid'] = favoriteItemsid;
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['items_name_ar'] = itemsNameAr;
    data['items_desc'] = itemsDesc;
    data['items_desc_ar'] = itemsDescAr;
    data['items_image'] = itemsImage;
    data['items_count'] = itemsCount;
    data['items_active'] = itemsActive;
    data['items_price'] = itemsPrice;
    data['items_discount'] = itemsDiscount;
    data['items_date'] = itemsDate;
    data['items_cat'] = itemsCat;
    data['users_id'] = usersId;
    data['itemspricediscount'] = itemsPriceDiscount;
    return data;
  }
}
