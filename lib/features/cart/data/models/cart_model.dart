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
  // ignore: non_constant_identifier_names
  final int items_price;
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
    // ignore: non_constant_identifier_names
    required this.items_price,
    required this.itemsDiscount,
    required this.itemsDate,
    required this.itemsCat,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      itemsPrice: json['itemsprice'],
      countItems: json['countitems'],
      cartId: json['cart_id'],
      cartUsersId: json['cart_usersid'],
      cartItemsId: json['cart_itemsid'],
      itemsId: json['items_id'],
      itemsName: json['items_name'],
      itemsNameAr: json['items_name_ar'],
      itemsDesc: json['items_desc'],
      itemsDescAr: json['items_desc_ar'],
      itemsImage: json['items_image'],
      itemsCount: json['items_count'],
      itemsActive: json['items_active'],
      items_price: json['items_price'],
      itemsDiscount: json['items_discount'],
      itemsDate: DateTime.parse(json['items_date']),
      itemsCat: json['items_cat'],
    );
  }
}

class CountPrice {
  final int totalPrice;
  final String totalCount;

  CountPrice({required this.totalPrice, required this.totalCount});

  factory CountPrice.fromJson(Map<String, dynamic> json) {
    return CountPrice(
      totalPrice: json['totalprice'],
      totalCount: json['totalcount'],
    );
  }
}

class CartModel {
  final List<CartItem> cartItems;
  final CountPrice countPrice;

  CartModel({required this.cartItems, required this.countPrice});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    List<CartItem> itemsList = [];

    if (json['datacart']["status"] == "failure") {
      itemsList = [];
    } else {
      var list = json['datacart']["data"] as List;
      itemsList = list.map((item) => CartItem.fromJson(item)).toList();
    }

    return CartModel(
      cartItems: itemsList,
      countPrice: json['countprice'] == false
          ? CountPrice.fromJson({"totalprice": 0, "totalcount": "0"})
          : CountPrice.fromJson(json['countprice']),
    );
  }
}
