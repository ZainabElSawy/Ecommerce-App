part of 'coupon_cubit.dart';

@immutable
sealed class CouponState {}

final class CouponInitial extends CouponState {}
class CouponLoading extends CouponState {}

class CouponSuccess extends CouponState {
  final CouponModel couponModel;
  CouponSuccess(this.couponModel);
}

class CouponServerFailure extends CouponState {
  final String errMessage;
  CouponServerFailure(this.errMessage);
}

class CouponNetworkFailure extends CouponState {
  final String errMessage;
  CouponNetworkFailure(this.errMessage);
}

class CouponFailure extends CouponState {
  final String errMessage;
  CouponFailure(this.errMessage);
}