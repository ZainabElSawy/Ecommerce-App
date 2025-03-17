import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/models/coupon_model.dart';
import '../../../domain/repositories/cart_repo.dart';

part 'coupon_state.dart';

class CouponCubit extends Cubit<CouponState> {
  CouponCubit(this.cartRepo) : super(CouponInitial());
  CartRepo cartRepo;
  String? couponName;
  checkCoupon({required String couponName}) async {
    emit(CouponLoading());
    var result = await cartRepo.checkCoupon(couponName: couponName);
    result.fold((failure) {
      if (failure is ServerFailure) {
        log(failure.errorMessage);
        emit(CouponServerFailure(failure.errorMessage));
      } else if (failure is NetworkFailure) {
        log(failure.errorMessage);

        emit(CouponNetworkFailure(failure.errorMessage));
      } else if (failure is DataFailure) {
        log(failure.errorMessage);

        emit(CouponFailure(failure.errorMessage));
      }
    }, (couponModel) {
      emit(CouponSuccess(couponModel));
    });
  }
}
