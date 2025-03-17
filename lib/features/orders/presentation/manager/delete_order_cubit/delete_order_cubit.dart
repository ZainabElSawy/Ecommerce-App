import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/repository/orders_repo.dart';

part 'delete_order_state.dart';

class DeleteOrderCubit extends Cubit<DeleteOrderState> {
  DeleteOrderCubit(this.ordersRepo) : super(DeleteOrderInitial());
  OrdersRepo ordersRepo;
  deleteOrder({required int orderId}) async {
    emit(DeleteOrderLoading());
    var result = await ordersRepo.deleteOrder(orderId: orderId);
    result.fold((failure) {
      if (failure is ServerFailure) {
        emit(DeleteOrderServerFailure(failure.errorMessage));
      } else if (failure is NetworkFailure) {
        emit(DeleteOrderNetworkFailure(failure.errorMessage));
      } 
    }, (deleteOrder) {
      emit(DeleteOrderSuccess(deleteOrder));
    });
  }
}
