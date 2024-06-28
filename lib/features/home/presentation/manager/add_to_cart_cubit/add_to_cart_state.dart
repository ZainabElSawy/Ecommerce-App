part of 'add_to_cart_cubit.dart';

@immutable
sealed class AddToCartState {}

final class AddtoCartInitial extends AddToCartState {}

class AddToCartSuccess extends AddToCartState {
 final String? count;
  AddToCartSuccess({
    this.count,
  });
}

class AddToCartServerFailure extends AddToCartState {
  final String errMessage;
  AddToCartServerFailure(this.errMessage);
}
