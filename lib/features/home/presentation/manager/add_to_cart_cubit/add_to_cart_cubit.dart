import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/services/api_services.dart';
import 'package:ecommerce_app/features/cart/data/datasources/cart_data_source.dart';
import 'package:ecommerce_app/features/cart/domain/repositories/cart_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../main.dart';

part 'add_to_cart_state.dart';

class AddtoCartCubit extends Cubit<AddToCartState> {
  AddtoCartCubit(this.cartRepo) : super(AddtoCartInitial());
  CartRepo cartRepo;
  addToCart({required int itemId}) async {
    log("Add to cart");
    var result = await cartRepo.addToCart(itemId: itemId);
    result.fold((failure) {
      if (failure is ServerFailure) {
        log(failure.errorMessage);
        emit(AddToCartServerFailure(failure.errorMessage));
      }
    }, (status) {
      log("Success");
      emit(AddToCartSuccess());
    });
  }

  removeFromCart({required int itemId}) async {
    var result = await cartRepo.removeFromCart(itemId: itemId);
    result.fold((failure) {
      if (failure is ServerFailure) {
        emit(AddToCartServerFailure(failure.errorMessage));
      }
    }, (status) {
      emit(AddToCartSuccess());
    });
  }

  itemsCountCart({required int itemId}) async {
    CartDataSource cartDataSource = CartDataSourceImp(ApiService(Dio()));
    String result = await cartDataSource.itemsCountCart(
        itemId: itemId, userId: sharedPreferences!.getInt("userid")!);
    log("*********$result");
    return result;
  }
}
