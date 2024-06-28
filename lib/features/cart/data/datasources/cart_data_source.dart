import 'dart:developer';

import 'package:ecommerce_app/core/constant/linkapi.dart';
import '../../../../core/services/api_services.dart';

abstract class CartDataSource {
  Future<String> addToCart({required int userId, required int itemId});
  Future<String> removeFromCart({required int userId, required int itemId});
  Future<String> itemsCountCart({required int userId, required int itemId});
  Future<String> viewCart({required int favId});
}

class CartDataSourceImp extends CartDataSource {
  final ApiService apiService;

  CartDataSourceImp(this.apiService);

  @override
  Future<String> addToCart({
    required int userId,
    required int itemId,
  }) async {
    Map<String, dynamic> data =
        await apiService.post(endPoint: AppLinks.cartAdd, data: {
      "cart_usersid": userId,
      "cart_itemsid": itemId,
    });
    return data["status"];
  }

  @override
  Future<String> removeFromCart({
    required int userId,
    required int itemId,
  }) async {
    Map<String, dynamic> data =
        await apiService.post(endPoint: AppLinks.cartDelete, data: {
      "cart_usersid": userId,
      "cart_itemsid": itemId,
    });

    return data["status"];
  }

  @override
  Future<String> viewCart({required int favId}) async {
    Map<String, dynamic> data =
        await apiService.post(endPoint: AppLinks.removeFromFavorite, data: {
      "favorite_id": favId,
    });
    return data["status"];
  }

  @override
  Future<String> itemsCountCart({
    required int userId,
    required int itemId,
  }) async {
    Map<String, dynamic> data =
        await apiService.post(endPoint: AppLinks.cartItemsCount, data: {
      "cart_usersid": userId,
      "cart_itemsid": itemId,
    });
    log("${data["data"]}");
    return data["data"].toString();
  }
}

// List<CategoriesModel> getCategoriesList(Map<String, dynamic> data) {
//   List<CategoriesModel> categories = [];
//   for (var cat in data["categories"]) {
//     categories.add(CategoriesModel.fromJson(cat));
//   }
//   return categories;
// }

// List<ItemModel>? getItemsList(List data) {
//   List<ItemModel> items = [];
//   for (var item in data) {
//     items.add(ItemModel.fromJson(item));
//   }
//   return items;
// }
// List<MyFavoriteModel>? getFavoriteItemsList(Map<String, dynamic> data) {
//   List<MyFavoriteModel> items = [];
//   for (var item in data["data"]??[]) {
//     items.add(MyFavoriteModel.fromJson(item));
//   }
//   return items;
// }
