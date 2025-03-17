import 'package:hive/hive.dart';
part 'categories_model.g.dart';

@HiveType(typeId: 1)
class CategoriesModel extends HiveObject {
  @HiveField(0)
  int? categoriesId;
  @HiveField(1)
  String? categoriesName;
  @HiveField(2)
  String? categoriesNameAr;
  @HiveField(3)
  String? categoriesImage;
  @HiveField(4)
  String? categoriesDatetime;

  CategoriesModel({
    this.categoriesId,
    this.categoriesName,
    this.categoriesNameAr,
    this.categoriesImage,
    this.categoriesDatetime,
  });

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    // Convert 'categories_id' from String to int
    categoriesId = int.tryParse(json['categories_id'].toString());
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categories_id'] = categoriesId;
    data['categories_name'] = categoriesName;
    data['categories_name_ar'] = categoriesNameAr;
    data['categories_image'] = categoriesImage;
    data['categories_datetime'] = categoriesDatetime;
    return data;
  }
}
