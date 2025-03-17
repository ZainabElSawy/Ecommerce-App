import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/features/orders/data/model/order_details_model.dart';
import 'package:ecommerce_app/features/orders/data/model/order_model.dart';
import 'package:ecommerce_app/main.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/repository/orders_repo.dart';
import '../datasource/orders_datatsource.dart';

class OrdersRepoImp implements OrdersRepo {
  final OrdersDataSource orderDataSource;
  OrdersRepoImp(this.orderDataSource);

  @override
  Future<Either<Failure, List<OrderModel>?>> fetchPendingOrders() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        List<OrderModel>? orders = await orderDataSource.fetchPendingOrders(
            userId: sharedPreferences!.getInt("userid")!);

        return right(orders);
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
  Future<Either<Failure, List<OrderDetailsModel>>> fetchOrderDetails(
      {required int orderId}) async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        List<OrderDetailsModel> orderDetails =
            await orderDataSource.fetchOrderDetails(orderId: orderId);

        return right(orderDetails);
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
  Future<Either<Failure, String>> deleteOrder({required int orderId}) async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        String deleteOrder =
            await orderDataSource.deleteOrder(orderId: orderId);

        return right(deleteOrder);
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
  Future<Either<Failure, List<OrderModel>?>> fetchArchivedOrders() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        List<OrderModel>? orders = await orderDataSource.fetchArchivedOrders(
            userId: sharedPreferences!.getInt("userid")!);

        return right(orders);
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
  Future<Either<Failure, String>> updateOrdersRating({
    required int orderId,
    required int rating,
    required String comment,
  }) async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        String updateRatingStatus =
            await orderDataSource.updateOrdersRating(orderId: orderId, rating: rating, comment: comment);

        return right(updateRatingStatus);
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
