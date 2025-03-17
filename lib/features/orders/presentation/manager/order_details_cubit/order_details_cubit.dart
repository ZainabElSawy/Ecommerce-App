import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/features/orders/data/model/order_details_model.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/repository/orders_repo.dart';

part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit(this.ordersRepo) : super(OrderDetailsInitial());
  OrdersRepo ordersRepo;
  fetchOrderDetails({required int orderId}) async {
    emit(OrderDetailsLoading());
    var result = await ordersRepo.fetchOrderDetails(orderId: orderId);
    result.fold((failure) {
      if (failure is ServerFailure) {
        emit(OrderDetailsServerFailure(failure.errorMessage));
      } else if (failure is NetworkFailure) {
        emit(OrderDetailsNetworkFailure(failure.errorMessage));
      } 
    }, (orderDetails) {
      emit(OrderDetailsSuccess(orderDetails));
    });
  }
}
