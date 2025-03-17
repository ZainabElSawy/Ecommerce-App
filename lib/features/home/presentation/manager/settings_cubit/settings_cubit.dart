import 'package:ecommerce_app/features/home/data/models/settings_model.dart';
import 'package:ecommerce_app/features/home/domain/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this.homeRepo) : super(SettingsInitial());
  HomeRepo homeRepo;
  fetchSettings() async {
    emit(SettingsLoading());
    var result = await homeRepo.fetchSettings();
    result.fold((failure) {
      if (failure is ServerFailure) {
        emit(SettingsServerFailure(failure.errorMessage));
      } else if (failure is NetworkFailure) {
        emit(SettingsNetworkFailure(failure.errorMessage));
      }
    }, (settings) {
      emit(SettingsSuccess(settings));
    });
  }
}
