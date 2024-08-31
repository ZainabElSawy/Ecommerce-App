import 'dart:developer';

import 'package:ecommerce_app/core/constant/linkapi.dart';
import '../../../../core/services/api_services.dart';
import '../models/cart_model.dart';

abstract class CartDataSource {
  Future<String> addToCart({required int userId, required int itemId});
  Future<String> removeFromCart({required int userId, required int itemId});
  Future<String> itemsCountCart({required int userId, required int itemId});
  Future<CartModel> viewCart({required int userId});
  Future<Map<String, dynamic>> checkCoupon({required String couponName});
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
  Future<CartModel> viewCart({required int userId}) async {
    Map<String, dynamic> data =
        await apiService.post(endPoint: AppLinks.cartView, data: {
      "usersid": userId,
    });
    return CartModel.fromJson(data);
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
    return data["data"].toString();
  }

  @override
  Future<Map<String, dynamic>> checkCoupon({required String couponName}) async {
    Map<String, dynamic> data =
        await apiService.post(endPoint: AppLinks.checkcoupon, data: {
      "coupon_name": couponName,
    });
    log("$data");
    return data;
  }
}
