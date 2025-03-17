import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/features/home/data/models/item_model.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/repos/home_repo.dart';

part 'items_state.dart';

class ItemsCubit extends Cubit<ItemsState> {
  ItemsCubit(this.homeRepo) : super(ItemsInitial());
  HomeRepo homeRepo;

  fetchItems() async {
    emit(ItemsLoading());
    var result = await homeRepo.fetchItems();
    result.fold((failure) {
      if (failure is ServerFailure) {
        emit(ItemsServerFailure(failure.errorMessage));
      } else if (failure is NetworkFailure) {
        emit(ItemsNetworkFailure(failure.errorMessage));
      }
    }, (items) {
      emit(ItemsSuccess(items));
    });
  }
}
