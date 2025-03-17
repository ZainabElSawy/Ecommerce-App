class Item {
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
	int? itemspricediscount;

	Item({
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
		this.itemspricediscount, 
	});

	factory Item.fromJson(Map<String, dynamic> json) => Item(
				countitems: json['countitems'] as int?,
				cartId: json['cart_id'] as int?,
				cartUsersid: json['cart_usersid'] as int?,
				cartItemsid: json['cart_itemsid'] as int?,
				cartOrders: json['cart_orders'] as int?,
				itemsId: json['items_id'] as int?,
				itemsName: json['items_name'] as String?,
				itemsNameAr: json['items_name_ar'] as String?,
				itemsDesc: json['items_desc'] as String?,
				itemsDescAr: json['items_desc_ar'] as String?,
				itemsImage: json['items_image'] as String?,
				itemsCount: json['items_count'] as int?,
				itemsActive: json['items_active'] as int?,
				itemsPrice: json['items_price'] as int?,
				itemsDiscount: json['items_discount'] as int?,
				itemsDate: json['items_date'] as String?,
				itemsCat: json['items_cat'] as int?,
				itemspricediscount: json['itemspricediscount'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'countitems': countitems,
				'cart_id': cartId,
				'cart_usersid': cartUsersid,
				'cart_itemsid': cartItemsid,
				'cart_orders': cartOrders,
				'items_id': itemsId,
				'items_name': itemsName,
				'items_name_ar': itemsNameAr,
				'items_desc': itemsDesc,
				'items_desc_ar': itemsDescAr,
				'items_image': itemsImage,
				'items_count': itemsCount,
				'items_active': itemsActive,
				'items_price': itemsPrice,
				'items_discount': itemsDiscount,
				'items_date': itemsDate,
				'items_cat': itemsCat,
				'itemspricediscount': itemspricediscount,
			};
}
