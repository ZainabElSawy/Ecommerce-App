part of 'cart_cubit.dart';
@immutable
sealed class CartState {}
class CartInitial extends CartState {}
class CartLoading extends CartState {}

class CartSuccess extends CartState {
  final CartModel cartModel;
  CartSuccess(this.cartModel);
}

class CartServerFailure extends CartState {
  final String errMessage;
  CartServerFailure(this.errMessage);
}

class CartNetworkFailure extends CartState {
  final String errMessage;
  CartNetworkFailure(this.errMessage);
}

class CartFailure extends CartState {
  final String errMessage;
  CartFailure(this.errMessage);
}
