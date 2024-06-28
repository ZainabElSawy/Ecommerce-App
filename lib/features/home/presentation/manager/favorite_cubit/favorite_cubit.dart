import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/repos/home_repo.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit(this.homeRepo) : super(FavoriteInitial());
  HomeRepo homeRepo;
  Map isFavorite = {};
  setFavorite(id, val) {
    isFavorite[id] = val;
  }

  addToFavorite({required int itemId}) async {
    var result = await homeRepo.addToFavorite(itemId: itemId);
    result.fold((failure) {
      if (failure is ServerFailure) {
        emit(FavoriteServerFailure(failure.errorMessage));
      }
    }, (status) {
      emit(FavoriteSuccess());
    });
  }
  removeFromFavorite({required int itemId}) async {
    var result = await homeRepo.removeFromFavorite(itemId: itemId);
    result.fold((failure) {
      if (failure is ServerFailure) {
        emit(FavoriteServerFailure(failure.errorMessage));
      }
    }, (status) {
      emit(FavoriteSuccess());
    });
  }
}
