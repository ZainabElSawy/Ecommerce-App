import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/repositories/cart_repo.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this.cartRepo) : super(CheckoutInitial());
  CartRepo cartRepo;
  String paymentType = "cash";
  String deliveryType = "delivery";
  int addressId = 2;
  int selectedIndex = 0;
  checkout({
    required int addressid,
    required int orderstype,
    required int pricedelivery,
    required int ordersprice,
    required int couponid,
    required int couponDiscount,
    required int paymentmethod,
  }) async {
    emit(CheckoutLoading());
    var result = await cartRepo.checkout(
      addressid: addressid,
      orderstype: orderstype,
      pricedelivery: pricedelivery,
      ordersprice: ordersprice,
      couponid: couponid,
      couponDiscount: couponDiscount,
      paymentmethod: paymentmethod,
    );
    result.fold((failure) {
      if (failure is ServerFailure) {
        emit(CheckoutServerFailure(failure.errorMessage));
      } else if (failure is NetworkFailure) {
        emit(CheckoutNetworkFailure(failure.errorMessage));
      } else if (failure is DataFailure) {
        emit(CheckoutFailure(failure.errorMessage));
      }
    }, (status) {
      emit(CheckoutSuccess(status));
    });
  }
}
