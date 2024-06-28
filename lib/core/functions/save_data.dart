import 'package:ecommerce_app/features/home/data/models/categories_model.dart';
import 'package:ecommerce_app/features/home/data/models/item_model.dart';
import 'package:hive/hive.dart';


void saveCategoriesData(List<CategoriesModel> categories, String boxName) {
  var box = Hive.box<CategoriesModel>(boxName);
  box.addAll(categories);
}
void saveItemsData(List<ItemModel> items, String boxName) {
  var box = Hive.box<ItemModel>(boxName);
  box.addAll(items);
}
