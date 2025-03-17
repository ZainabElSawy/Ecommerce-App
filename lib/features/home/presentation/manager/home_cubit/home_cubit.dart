import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/models/home_model/home_model.dart';
import '../../../domain/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeInitial());
  HomeRepo homeRepo;

  fetchHome() async {
    emit(HomeLoading());
    var result = await homeRepo.fetchHomeContent();
    result.fold((failure) {
      if (failure is ServerFailure) {
        emit(HomeServerFailure(failure.errorMessage));
      } else if (failure is NetworkFailure) {
        emit(HomeNetworkFailure(failure.errorMessage));
      }
    }, (homeModel) {
      emit(HomeSuccess(homeModel));
    });
  }
}
