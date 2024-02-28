import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/models/user_model.dart';
import '../../../domain/repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  AuthRepo authRepo;

   login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    var result =
        await authRepo.login(email: email, password: password);
    result.fold((failure) {
      if (failure is ServerFailure) {
        emit(LoginServerFailure(failure.errorMessage));
      } else if (failure is NetworkFailure) {
        emit(LoginNetworkFailure(failure.errorMessage));
      } else if (failure is DataFailure) {
        emit(LoginFailure(failure.errorMessage));
      }
    }, (user) {
      emit(LoginSuccess(user));
    });
  }
}
