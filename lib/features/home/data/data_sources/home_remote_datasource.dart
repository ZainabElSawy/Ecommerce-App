import 'package:ecommerce_app/core/constant/linkapi.dart';
import 'package:ecommerce_app/features/home/data/models/categories_model.dart';

import '../../../../core/constant/constants.dart';
import '../../../../core/functions/save_data.dart';
import '../../../../core/services/api_services.dart';
import '../models/item_model.dart';
import '../models/my_favorite_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<CategoriesModel>> fetchCategories();
  Future<List<ItemModel>> fetchItems();
  Future<List<ItemModel>>? fetchAllItemData(
      {required int catId, required int usersId});
  Future<String> addToFavorite({required int userId, required int itemId});
  Future<String> removeFromFavorite({required int userId, required int itemId});
  Future<String> removeItemFromFavorite({required int favId});
  Future<List<MyFavoriteModel>> fetchMyFavoriteItems({required int userId});
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImp(this.apiService);
  @override
  Future<List<CategoriesModel>> fetchCategories() async {
    Map<String, dynamic> data = await apiService.get(endPoint: AppLinks.home);
    List<CategoriesModel> categories = getCategoriesList(data);
    saveCategoriesData(categories, kCategories);
    return categories;
  }

  @override
  Future<List<ItemModel>> fetchItems() async {
    Map<String, dynamic> data = await apiService.get(endPoint: AppLinks.home);
    List<ItemModel> items = getItemsList(data["items"] ?? []) ?? [];
    saveItemsData(items, kItems);
    return items;
  }

  @override
  Future<List<ItemModel>> fetchAllItemData(
      {required int catId, required int usersId}) async {
    Map<String, dynamic> data =
        await apiService.post(endPoint: AppLinks.items, data: {
      "categories_id": catId,
      "users_id": usersId,
    });
    List<ItemModel>? items = getItemsList(data["data"] ?? []) ?? [];
    return items;
  }

  @override
  Future<String> addToFavorite(
      {required int userId, required int itemId}) async {
    Map<String, dynamic> data =
        await apiService.post(endPoint: AppLinks.favoriteAdd, data: {
      "favorite_usersid": userId,
      "favorite_itemsid": itemId,
    });
    return data["status"];
  }

  @override
  Future<String> removeFromFavorite(
      {required int userId, required int itemId}) async {
    Map<String, dynamic> data =
        await apiService.post(endPoint: AppLinks.favoriteRemove, data: {
      "favorite_usersid": userId,
      "favorite_itemsid": itemId,
    });
    return data["status"];
  }

  @override
  Future<List<MyFavoriteModel>> fetchMyFavoriteItems(
      {required int userId}) async {
    Map<String, dynamic> data =
        await apiService.post(endPoint: AppLinks.myFavorite, data: {
      "favorite_usersid": userId,
    });
    List<MyFavoriteModel> favItems = getFavoriteItemsList(data) ?? [];

    return favItems;
  }
  
  @override
  Future<String> removeItemFromFavorite({required int favId})async {
    Map<String, dynamic> data =
        await apiService.post(endPoint: AppLinks.removeFromFavorite, data: {
      "favorite_id": favId,
    });
    return data["status"];
  }
}

List<CategoriesModel> getCategoriesList(Map<String, dynamic> data) {
  List<CategoriesModel> categories = [];
  for (var cat in data["categories"]) {
    categories.add(CategoriesModel.fromJson(cat));
  }
  return categories;
}

List<ItemModel>? getItemsList(List data) {
  List<ItemModel> items = [];
  for (var item in data) {
    items.add(ItemModel.fromJson(item));
  }
  return items;
}
List<MyFavoriteModel>? getFavoriteItemsList(Map<String, dynamic> data) {
  List<MyFavoriteModel> items = [];
  for (var item in data["data"]??[]) {
    items.add(MyFavoriteModel.fromJson(item));
  }
  return items;
}
