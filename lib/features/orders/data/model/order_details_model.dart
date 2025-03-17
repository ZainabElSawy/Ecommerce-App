class OrderDetailsModel {
  int? itemsprice;
  int? countitems;
  int? cartId;
  int? cartUsersid;
  int? cartItemsid;
  int? cartOrders;
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

  OrderDetailsModel({
    this.itemsprice,
    this.countitems,
    this.cartId,
    this.cartUsersid,
    this.cartItemsid,
    this.cartOrders,
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
  });

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    itemsprice = int.tryParse(json['itemsprice'].toString());
    countitems = int.tryParse(json['countitems'].toString());
    cartId = int.tryParse(json['cart_id'].toString());
    cartUsersid = int.tryParse(json['cart_usersid'].toString());
    cartItemsid = int.tryParse(json['cart_itemsid'].toString());
    cartOrders = int.tryParse(json['cart_orders'].toString());
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['itemsprice'] = itemsprice;
    data['countitems'] = countitems;
    data['cart_id'] = cartId;
    data['cart_usersid'] = cartUsersid;
    data['cart_itemsid'] = cartItemsid;
    data['cart_orders'] = cartOrders;
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
    return data;
  }
}
