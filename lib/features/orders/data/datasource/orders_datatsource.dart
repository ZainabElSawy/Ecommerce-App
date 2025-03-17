import 'dart:developer';

import 'package:ecommerce_app/core/constant/linkapi.dart';
import 'package:ecommerce_app/features/orders/data/model/order_details_model.dart';
import '../../../../core/services/api_services.dart';
import '../model/order_model.dart';

abstract class OrdersDataSource {
  Future<List<OrderModel>?> fetchPendingOrders({required int userId});
  Future<List<OrderModel>?> fetchArchivedOrders({required int userId});
  Future<List<OrderDetailsModel>> fetchOrderDetails({required int orderId});
  Future<String> deleteOrder({required int orderId});
  Future<String> updateOrdersRating(
      {required int orderId, required int rating, required String comment});
}

class OrdersDataSourceImp extends OrdersDataSource {
  final ApiService apiService;

  OrdersDataSourceImp(this.apiService);

  @override
  Future<List<OrderModel>?> fetchPendingOrders({required int userId}) async {
    Map<String, dynamic> data =
        await apiService.post(endPoint: AppLinks.pending, data: {
      "orders_usersid": userId,
    });
    log(data.toString());

    List<OrderModel>? orders =
        (data["status"] == "success") ? getOrdersList(data) : [];
    return orders;
  }

  @override
  Future<List<OrderDetailsModel>> fetchOrderDetails(
      {required int orderId}) async {
    Map<String, dynamic> data =
        await apiService.post(endPoint: AppLinks.orderDetails, data: {
      "id": orderId,
    });
    log(data.toString());
    List<OrderDetailsModel> orders = getOrderDetailsList(data);
    return orders;
  }

  @override
  Future<String> deleteOrder({required int orderId}) async {
    Map<String, dynamic> data =
        await apiService.post(endPoint: AppLinks.deleteOrder, data: {
      "id": orderId,
    });
    return data["status"];
  }

  @override
  Future<List<OrderModel>?> fetchArchivedOrders({required int userId}) async {
    Map<String, dynamic> data =
        await apiService.post(endPoint: AppLinks.archive, data: {
      "orders_usersid": userId,
    });
    log(data.toString());
    List<OrderModel>? orders =
        (data["status"] == "success") ? getOrdersList(data) : [];
    return orders;
  }

  @override
  Future<String> updateOrdersRating(
      {required int orderId,
      required int rating,
      required String comment}) async {
    Map<String, dynamic> data =
        await apiService.post(endPoint: AppLinks.ordersRating, data: {
      "id": orderId,
      "rating": rating,
      "comment": comment,
    });
    return data["status"];
  }
}

List<OrderModel> getOrdersList(Map<String, dynamic> data) {
  List<OrderModel> orders = [];
  for (var item in data["data"]) {
    orders.add(OrderModel.fromJson(item));
  }
  return orders;
}

List<OrderDetailsModel> getOrderDetailsList(Map<String, dynamic> data) {
  List<OrderDetailsModel> orders = [];
  for (var item in data["data"]) {
    orders.add(OrderDetailsModel.fromJson(item));
  }
  return orders;
}
