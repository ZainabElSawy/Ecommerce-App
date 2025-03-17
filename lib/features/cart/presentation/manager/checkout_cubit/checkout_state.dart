part of 'checkout_cubit.dart';

@immutable
sealed class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}
class CheckoutLoading extends CheckoutState {}

class CheckoutSuccess extends CheckoutState {
  final String status;
  CheckoutSuccess(this.status);
}

class CheckoutServerFailure extends CheckoutState {
  final String errMessage;
  CheckoutServerFailure(this.errMessage);
}

class CheckoutNetworkFailure extends CheckoutState {
  final String errMessage;
  CheckoutNetworkFailure(this.errMessage);
}

class CheckoutFailure extends CheckoutState {
  final String errMessage;
  CheckoutFailure(this.errMessage);
}
