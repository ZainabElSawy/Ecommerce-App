import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/repository/orders_repo.dart';

part 'update_rating_state.dart';

class UpdateRatingCubit extends Cubit<UpdateRatingState> {
  UpdateRatingCubit(this.ordersRepo) : super(UpdateRatingInitial());
  OrdersRepo ordersRepo;

  updateOrdersRating({
    required int orderId,
    required int rating,
    required String comment,
  }) async {
    emit(UpdateRatingLoading());
    var result = await ordersRepo.updateOrdersRating(
        orderId: orderId, rating: rating, comment: comment);
    result.fold((failure) {
      if (failure is ServerFailure) {
        emit(UpdateRatingServerFailure(failure.errorMessage));
      } else if (failure is NetworkFailure) {
        emit(UpdateRatingNetworkFailure(failure.errorMessage));
      }
    }, (updateRatingStatus) {
      emit(UpdateRatingSuccess(updateRatingStatus));
    });
  }
}
