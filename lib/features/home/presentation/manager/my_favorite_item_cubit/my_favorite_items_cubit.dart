import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/features/home/data/models/my_favorite_model.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/repos/home_repo.dart';

part 'my_favorite_items_state.dart';

class MyFavoriteItemsCubit extends Cubit<MyFavoriteItemsState> {
  MyFavoriteItemsCubit(this.homeRepo) : super(MyFavoriteItemsInitial());
  HomeRepo homeRepo;
  fetchMyFavoriteItems() async {
    emit(MyFavoriteItemsLoading());
    var result = await homeRepo.fetchMyFavoriteItems();
    result.fold((failure) {
      if (failure is ServerFailure) {
        emit(MyFavoriteItemsServerFailure(failure.errorMessage));
      } else if (failure is NetworkFailure) {
        emit(MyFavoriteItemsNetworkFailure(failure.errorMessage));
      }
    }, (items) {
      emit(MyFavoriteItemsSuccess(items));
    });
  }
}
