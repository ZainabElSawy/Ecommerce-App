// class HomeModel {
//   String? status;
//   Settings? settings;
//   Settings? categories;
//   Settings? items;

//   HomeModel({this.status, this.settings, this.categories, this.items});

//   HomeModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     settings =
//         json['settings'] != null ? Settings.fromJson(json['settings']) : null;
//     categories = json['categories'] != null
//         ? Settings.fromJson(json['categories'])
//         : null;
//     items = json['items'] != null ? Settings.fromJson(json['items']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'status': status,
//       'settings': settings?.toJson(),
//       'categories': categories?.toJson(),
//       'items': items?.toJson(),
//     };
//   }
// }

// class Settings {
//   List<SettingData>? data;

//   Settings({this.data});

//   Settings.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data =
//           (json['data'] as List).map((v) => SettingData.fromJson(v)).toList();
//     }
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'data': data?.map((v) => v.toJson()).toList(),
//     };
//   }
// }

// class SettingData {
//   int? settingsId;
//   String? settingsTitleHome;
//   String? settingsBodyHome;

//   SettingData({this.settingsId, this.settingsTitleHome, this.settingsBodyHome});

//   SettingData.fromJson(Map<String, dynamic> json) {
//     settingsId = json['settings_id'];
//     settingsTitleHome = json['settings_titlehome'];
//     settingsBodyHome = json['settings_bodyhome'];
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'settings_id': settingsId,
//       'settings_titlehome': settingsTitleHome,
//       'settings_bodyhome': settingsBodyHome,
//     };
//   }
// }

// class CategoryData {
//   int? categoriesId;
//   String? categoriesName;
//   String? categoriesNameAr;
//   String? categoriesImage;
//   String? categoriesDatetime;

//   CategoryData(
//       {this.categoriesId,
//       this.categoriesName,
//       this.categoriesNameAr,
//       this.categoriesImage,
//       this.categoriesDatetime});

//   CategoryData.fromJson(Map<String, dynamic> json) {
//     categoriesId = json['categories_id'];
//     categoriesName = json['categories_name'];
//     categoriesNameAr = json['categories_name_ar'];
//     categoriesImage = json['categories_image'];
//     categoriesDatetime = json['categories_datetime'];
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'categories_id': categoriesId,
//       'categories_name': categoriesName,
//       'categories_name_ar': categoriesNameAr,
//       'categories_image': categoriesImage,
//       'categories_datetime': categoriesDatetime,
//     };
//   }
// }

// class ItemData {
//   int? countItems;
//   int? cartId;
//   int? cartUserId;
//   int? cartItemId;
//   int? cartOrders;
//   int? itemsId;
//   String? itemsName;
//   String? itemsNameAr;
//   String? itemsDesc;
//   String? itemsDescAr;
//   String? itemsImage;
//   int? itemsCount;
//   int? itemsActive;
//   int? itemsPrice;
//   int? itemsDiscount;
//   String? itemsDate;
//   int? itemsCat;
//   int? itemsPriceDiscount;

//   ItemData({
//     this.countItems,
//     this.cartId,
//     this.cartUserId,
//     this.cartItemId,
//     this.cartOrders,
//     this.itemsId,
//     this.itemsName,
//     this.itemsNameAr,
//     this.itemsDesc,
//     this.itemsDescAr,
//     this.itemsImage,
//     this.itemsCount,
//     this.itemsActive,
//     this.itemsPrice,
//     this.itemsDiscount,
//     this.itemsDate,
//     this.itemsCat,
//     this.itemsPriceDiscount,
//   });

//   ItemData.fromJson(Map<String, dynamic> json) {
//     countItems = json['countitems'];
//     cartId = json['cart_id'];
//     cartUserId = json['cart_usersid'];
//     cartItemId = json['cart_itemsid'];
//     cartOrders = json['cart_orders'];
//     itemsId = json['items_id'];
//     itemsName = json['items_name'];
//     itemsNameAr = json['items_name_ar'];
//     itemsDesc = json['items_desc'];
//     itemsDescAr = json['items_desc_ar'];
//     itemsImage = json['items_image'];
//     itemsCount = json['items_count'];
//     itemsActive = json['items_active'];
//     itemsPrice = json['items_price'];
//     itemsDiscount = json['items_discount'];
//     itemsDate = json['items_date'];
//     itemsCat = json['items_cat'];
//     itemsPriceDiscount = json['itemspricediscount'];
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'countitems': countItems,
//       'cart_id': cartId,
//       'cart_usersid': cartUserId,
//       'cart_itemsid': cartItemId,
//       'cart_orders': cartOrders,
//       'items_id': itemsId,
//       'items_name': itemsName,
//       'items_name_ar': itemsNameAr,
//       'items_desc': itemsDesc,
//       'items_desc_ar': itemsDescAr,
//       'items_image': itemsImage,
//       'items_count': itemsCount,
//       'items_active': itemsActive,
//       'items_price': itemsPrice,
//       'items_discount': itemsDiscount,
//       'items_date': itemsDate,
//       'items_cat': itemsCat,
//       'itemspricediscount': itemsPriceDiscount,
//     };
//   }
// }
