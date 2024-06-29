import 'package:ecommerce_app/features/cart/data/models/cart_model.dart';
import 'package:ecommerce_app/features/cart/domain/repositories/cart_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());
  CartRepo cartRepo;
  fetchCartView() async {
    emit(CartLoading());
    var result = await cartRepo.viewCart();
    result.fold((failure) {
      if (failure is ServerFailure) {
        emit(CartServerFailure(failure.errorMessage));
      } else if (failure is NetworkFailure) {
        emit(CartNetworkFailure(failure.errorMessage));
      }
    }, (cartModel) {
      emit(CartSuccess(cartModel));
    });
  }
}
