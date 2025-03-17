class CartItem {
  final int itemsPrice;
  final int countItems;
  final int cartId;
  final int cartUsersId;
  final int cartItemsId;
  final int itemsId;
  final String itemsName;
  final String itemsNameAr;
  final String itemsDesc;
  final String itemsDescAr;
  final String itemsImage;
  final int itemsCount;
  final int itemsActive;
  final int itemsPriceDiscount;
  final int itemsDiscount;
  final DateTime itemsDate;
  final int itemsCat;

  CartItem({
    required this.itemsPrice,
    required this.countItems,
    required this.cartId,
    required this.cartUsersId,
    required this.cartItemsId,
    required this.itemsId,
    required this.itemsName,
    required this.itemsNameAr,
    required this.itemsDesc,
    required this.itemsDescAr,
    required this.itemsImage,
    required this.itemsCount,
    required this.itemsActive,
    required this.itemsPriceDiscount,
    required this.itemsDiscount,
    required this.itemsDate,
    required this.itemsCat,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      itemsPrice: int.tryParse(json['itemsprice'].toString()) ?? 0,
      countItems: int.tryParse(json['countitems'].toString()) ?? 0,
      cartId: int.tryParse(json['cart_id'].toString()) ?? 0,
      cartUsersId: int.tryParse(json['cart_usersid'].toString()) ?? 0,
      cartItemsId: int.tryParse(json['cart_itemsid'].toString()) ?? 0,
      itemsId: int.tryParse(json['items_id'].toString()) ?? 0,
      itemsName: json['items_name'] as String? ?? '',
      itemsNameAr: json['items_name_ar'] as String? ?? '',
      itemsDesc: json['items_desc'] as String? ?? '',
      itemsDescAr: json['items_desc_ar'] as String? ?? '',
      itemsImage: json['items_image'] as String? ?? '',
      itemsCount: int.tryParse(json['items_count'].toString()) ?? 0,
      itemsActive: int.tryParse(json['items_active'].toString()) ?? 0,
      itemsPriceDiscount: int.tryParse(json['items_price'].toString()) ?? 0,
      itemsDiscount: int.tryParse(json['items_discount'].toString()) ?? 0,
      itemsDate: DateTime.tryParse(json['items_date']) ?? DateTime.now(),
      itemsCat: int.tryParse(json['items_cat'].toString()) ?? 0,
    );
  }
}

class CountPrice {
  final int totalPrice;
  final int totalCount;

  CountPrice({required this.totalPrice, required this.totalCount});

  factory CountPrice.fromJson(Map<String, dynamic> json) {
    return CountPrice(
      totalPrice: int.tryParse(json['totalprice'].toString()) ?? 0,
      totalCount: int.tryParse(json['totalcount'].toString()) ?? 0,
    );
  }
}

class CartModel {
  final List<CartItem> cartItems;
  final CountPrice countPrice;

  CartModel({required this.cartItems, required this.countPrice});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    List<CartItem> itemsList = [];

    if (json['datacart'] != null && json['datacart']["data"] != null) {
      var list = json['datacart']["data"] as List;
      itemsList = list.map((item) => CartItem.fromJson(item)).toList();
    }

    return CartModel(
      cartItems: itemsList,
      countPrice: (json['countprice'] is Map<String, dynamic>)
          ? CountPrice.fromJson(json['countprice'])
          : CountPrice(totalPrice: 0, totalCount: 0),
    );
  }
}
