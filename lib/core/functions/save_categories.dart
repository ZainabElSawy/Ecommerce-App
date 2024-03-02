import 'package:ecommerce_app/features/home/data/models/categories_model.dart';
import 'package:hive/hive.dart';


void saveCategoriesData(List<CategoriesModel> categories, String boxName) {
  var box = Hive.box<CategoriesModel>(boxName);
  box.addAll(categories);
}
