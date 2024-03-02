
import 'package:ecommerce_app/core/constant/constants.dart';
import 'package:ecommerce_app/features/home/data/models/categories_model.dart';
import 'package:hive/hive.dart';

import '../../../../core/services/api_services.dart';

abstract class HomeLocalDataSource {
  List<CategoriesModel> fetchCategories();
}

class HomeLocalDataSourceImp extends HomeLocalDataSource {
  final ApiService apiService;

  HomeLocalDataSourceImp(this.apiService);

  @override
  List<CategoriesModel> fetchCategories() {
    Box<CategoriesModel> box = Hive.box<CategoriesModel>(kCategories);
    return box.values.toList();
  }
}
