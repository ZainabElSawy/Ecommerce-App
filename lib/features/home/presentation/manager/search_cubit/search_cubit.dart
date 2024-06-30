import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/models/item_model.dart';
import '../../../domain/repos/home_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.homeRepo) : super(SearchInitial());
  HomeRepo homeRepo;
    final TextEditingController textEditingController = TextEditingController();

  fetchSearch(String srch) async {
    emit(SearchLoading());
    var result = await homeRepo.search(srch);
    result.fold((failure) {
      if (failure is ServerFailure) {
        emit(SearchServerFailure(failure.errorMessage));
      } else if (failure is NetworkFailure) {
        emit(SearchNetworkFailure(failure.errorMessage));
      }
    }, (items) {
      emit(SearchSuccess(items));
    });
  }
}
