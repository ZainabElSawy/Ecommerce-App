import 'package:dartz/dartz.dart';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/main.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/repositories/cart_repo.dart';
import '../datasources/cart_data_source.dart';

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
  Future<Either<Failure, String>> viewCart({required int favId}) async {
    try {
      String status = await cartDataSource.viewCart(favId: favId);
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
}
