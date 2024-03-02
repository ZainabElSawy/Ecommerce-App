import 'dart:developer';

import 'package:ecommerce_app/core/constant/linkapi.dart';
import 'package:ecommerce_app/features/home/data/models/categories_model.dart';

import '../../../../core/constant/constants.dart';
import '../../../../core/functions/save_categories.dart';
import '../../../../core/services/api_services.dart';

abstract class HomeRemoteDataSource {
  Future<List<CategoriesModel>> fetchCategories();
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImp(this.apiService);
  @override
  Future<List<CategoriesModel>> fetchCategories() async {
    Map<String, dynamic> data = await apiService.get(endPoint: AppLinks.home);
    print("====================");
    print(data);
    print("====================");
    log("$data");
    List<CategoriesModel> categories = getCategoriesList(data);
    saveCategoriesData(categories, kCategories);
    return categories;
  }

  List<CategoriesModel> getCategoriesList(Map<String, dynamic> data) {
    List<CategoriesModel> categories = [];
    for (var bookMap in data["categories"]) {
      categories.add(CategoriesModel.fromJson(bookMap));
    }
    return categories;
  }
}
