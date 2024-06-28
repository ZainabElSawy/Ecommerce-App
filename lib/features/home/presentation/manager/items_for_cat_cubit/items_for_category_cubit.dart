import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/models/item_model.dart';
import '../../../domain/repos/home_repo.dart';

part 'items_for_category_state.dart';

class ItemsForCategoryCubit extends Cubit<ItemsForCategoryState> {
  ItemsForCategoryCubit(this.homeRepo) : super(ItemsForCategoryInitial());
  HomeRepo homeRepo;
  
  int selectedCategory = 0;
  fetchAllItemsData({required int categoryId}) async {
    emit(ItemsForCategoryLoading());
    var result = await homeRepo.fetchAllItemsData(catId: categoryId);
    result.fold((failure) {
      if (failure is ServerFailure) {
        emit(ItemsForCategoryServerFailure(failure.errorMessage));
      } else if (failure is NetworkFailure) {
        emit(ItemsForCategoryNetworkFailure(failure.errorMessage));
      }
    }, (items) {
      emit(ItemsForCategorySuccess(items));
    });
  }
}
