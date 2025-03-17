import 'package:hive/hive.dart';

part 'item_model.g.dart';

@HiveType(typeId: 3)
class ItemModel {
  @HiveField(0)
  int? itemsId;
  @HiveField(1)
  String? itemsName;
  @HiveField(2)
  String? itemsNameAr;
  @HiveField(3)
  String? itemsDesc;
  @HiveField(4)
  String? itemsDescAr;
  @HiveField(5)
  String? itemsImage;
  @HiveField(6)
  int? itemsCount;
  @HiveField(7)
  int? itemsActive;
  @HiveField(8)
  int? itemsPrice;
  @HiveField(9)
  int? itemsDiscount;
  @HiveField(10)
  String? itemsDate;
  @HiveField(11)
  int? itemsCat;
  @HiveField(12)
  int? categoriesId;
  @HiveField(13)
  String? categoriesName;
  @HiveField(14)
  String? categoriesNameAr;
  @HiveField(15)
  String? categoriesImage;
  @HiveField(16)
  String? categoriesDatetime;
  @HiveField(17)
  int? favorite;
  @HiveField(18)
  int? itemsPriceDiscount;

  ItemModel({
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
    this.categoriesId,
    this.categoriesName,
    this.categoriesNameAr,
    this.categoriesImage,
    this.categoriesDatetime,
    this.favorite,
    this.itemsPriceDiscount,
  });

  ItemModel.fromJson(Map<String, dynamic> json) {
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
    categoriesId = int.tryParse(json['categories_id'].toString());
    categoriesName = json['categories_name'] as String?;
    categoriesNameAr = json['categories_name_ar'] as String?;
    categoriesImage = json['categories_image'] as String?;
    categoriesDatetime = json['categories_datetime'] as String?;
    favorite = int.tryParse(json['favorite'].toString());
    itemsPriceDiscount = int.tryParse(json['itemspricediscount'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    data['categories_id'] = categoriesId;
    data['categories_name'] = categoriesName;
    data['categories_name_ar'] = categoriesNameAr;
    data['categories_image'] = categoriesImage;
    data['categories_datetime'] = categoriesDatetime;
    data['favorite'] = favorite;
    data['itemspricediscount'] = itemsPriceDiscount;
    return data;
  }
}
