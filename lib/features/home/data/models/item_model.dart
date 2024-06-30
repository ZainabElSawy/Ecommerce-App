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

  ItemModel(
      {this.itemsId,
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
      this.favorite,this.itemsPriceDiscount});

  ItemModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
    favorite = json['favorite'];
    itemsPriceDiscount = json['itemspricediscount'];
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
