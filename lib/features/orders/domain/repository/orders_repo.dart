import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/orders/data/model/order_model.dart';
import '../../../../core/errors/failure.dart';
import '../../data/model/order_details_model.dart';

abstract class OrdersRepo {
  Future<Either<Failure, List<OrderModel>?>> fetchPendingOrders();
  Future<Either<Failure, List<OrderModel>?>> fetchArchivedOrders();
  Future<Either<Failure, List<OrderDetailsModel>>> fetchOrderDetails(
      {required int orderId});
  Future<Either<Failure, String>> deleteOrder({required int orderId});
  Future<Either<Failure, String>> updateOrdersRating({
    required int orderId,
    required int rating,
    required String comment,
  });
}
