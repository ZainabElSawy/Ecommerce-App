import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/features/cart/data/models/coupon_model.dart';
import 'package:ecommerce_app/features/orders/data/model/order_model.dart';
import 'package:ecommerce_app/main.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/repositories/cart_repo.dart';
import '../datasources/cart_data_source.dart';
import '../models/cart_model.dart';

class CartRepoImp implements CartRepo {
  final CartDataSource cartDataSource;
  CartRepoImp(this.cartDataSource);

  @override
  Future<Either<Failure, String>> addToCart({required int itemId}) async {
    try {
      String status = await cartDataSource.addToCart(
          userId: sharedPreferences!.getInt("userid")!, itemId: itemId);
      if (status == "success") {
        return right(status);
      } else {
        return left(
            ServerFailure("Something went wrong ,please try again later!"));
      }
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> removeFromCart({required int itemId}) async {
    try {
      String status = await cartDataSource.removeFromCart(
          userId: sharedPreferences!.getInt("userid")!, itemId: itemId);
      if (status == "success") {
        return right(status);
      } else {
        return left(
            ServerFailure("Something went wrong ,please try again later!"));
      }
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CartModel>> viewCart() async {
    try {
      CartModel cartModel = await cartDataSource.viewCart(
          userId: sharedPreferences!.getInt("userid")!);
      return right(cartModel);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> itemsCountCart({required int itemId}) async {
    try {
      String count = await cartDataSource.itemsCountCart(
          userId: sharedPreferences!.getInt("userid")!, itemId: itemId);
      return right(count);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CouponModel>> checkCoupon(
      {required String couponName}) async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        Map<String, dynamic> data =
            await cartDataSource.checkCoupon(couponName: couponName);
        if (data["status"] == "success") {
          return right(CouponModel.fromJson(data["data"]));
        } else {
          return left(
              DataFailure("This coupon does not exist or may be expired !"));
        }
      } catch (e) {
        // ignore: deprecated_member_use
        if (e is DioError) {
          return left(ServerFailure.fromDioError(e));
        }
        return left(ServerFailure(e.toString()));
      }
    } else {
      return left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, String>> checkout({
    required int addressid,
    required int orderstype,
    required int pricedelivery,
    required int ordersprice,
    required int couponid,
    required int couponDiscount,
    required int paymentmethod,
  }) async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        String status = await cartDataSource.checkout(
          usersid: sharedPreferences!.getInt("userid")!,
          addressid: addressid,
          orderstype: orderstype,
          pricedelivery: pricedelivery,
          ordersprice: ordersprice,
          couponid: couponid,
          couponDiscount: couponDiscount,
          paymentmethod: paymentmethod,
        );
        if (status == "success") {
          return right(status);
        } else {
          return left(
            DataFailure("Something went wrong ,please try again later!"),
          );
        }
      } catch (e) {
        // ignore: deprecated_member_use
        if (e is DioError) {
          return left(ServerFailure.fromDioError(e));
        }
        return left(ServerFailure(e.toString()));
      }
    } else {
      return left(NetworkFailure('No internet connection'));
    }
  }
}

List<OrderModel> getOrdersList(Map<String, dynamic> data) {
  List<OrderModel> orders = [];
  for (var item in data["data"]) {
    orders.add(OrderModel.fromJson(item));
  }
  return orders;
}
