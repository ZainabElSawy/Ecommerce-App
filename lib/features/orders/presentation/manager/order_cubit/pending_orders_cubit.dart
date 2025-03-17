import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/features/orders/data/model/order_model.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/repository/orders_repo.dart';

part 'pending_orders_state.dart';

class OrdersCubit extends Cubit<PendingOrdersState> {
  OrdersCubit(this.ordersRepo) : super(PendingOrdersInitial());
  OrdersRepo ordersRepo;
  fetchPendingOrders() async {
    emit(PendingOrdersLoading());
    var result = await ordersRepo.fetchPendingOrders();
    result.fold((failure) {
      if (failure is ServerFailure) {
        emit(PendingOrdersServerFailure(failure.errorMessage));
      } else if (failure is NetworkFailure) {
        emit(PendingOrdersNetworkFailure(failure.errorMessage));
      } 
    }, (listOfOrders) {
      emit(PendingOrdersSuccess(listOfOrders));
    });
  }
  fetchArchivedOrders() async {
    emit(PendingOrdersLoading());
    var result = await ordersRepo.fetchArchivedOrders();
    result.fold((failure) {
      if (failure is ServerFailure) {
        emit(PendingOrdersServerFailure(failure.errorMessage));
      } else if (failure is NetworkFailure) {
        emit(PendingOrdersNetworkFailure(failure.errorMessage));
      } 
    }, (listOfOrders) {
      emit(PendingOrdersSuccess(listOfOrders));
    });
  }
  
}
