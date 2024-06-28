import 'package:ecommerce_app/features/home/domain/repos/home_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/models/categories_model.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.homeRepo) : super(CategoriesInitial());
  HomeRepo homeRepo;

  fetchCategories() async {
    emit(CategoriesLoading());
    var result = await homeRepo.fetchCategories();
    result.fold((failure) {
      if (failure is ServerFailure) {
        emit(CategoriesServerFailure(failure.errorMessage));
      } else if (failure is NetworkFailure) {
        emit(CategoriesNetworkFailure(failure.errorMessage));
      }
    }, (categories) {
      emit(CategoriesSuccess(categories));
    });
  }
}
