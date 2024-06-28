import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/repos/home_repo.dart';

part 'remove_item_from_favorite_state.dart';

class RemoveItemFromFavoriteCubit extends Cubit<RemoveItemFromFavoriteState> {
  RemoveItemFromFavoriteCubit(this.homeRepo)
      : super(RemoveItemFromFavoriteInitial());
  HomeRepo homeRepo;

  removeItemFromFavorite({required int favId}) async {
    var result = await homeRepo.removeItemFromFavorite(favId: favId);
    result.fold((failure) {
      if (failure is ServerFailure) {
        emit(RemoveItemFromFavoriteServerFailure(failure.errorMessage));
      }
    }, (status) {
      emit(RemoveItemFromFavoriteSuccess());
    });
  }
}
