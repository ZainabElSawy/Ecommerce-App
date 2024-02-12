import 'package:ecommerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  AuthRepo authRepo;
  login({
    required String email,
    required String password,
  }) async {}
  signUp({
    required String username,
    required String email,
    required String password,
    required String phone,
  }) async {
    emit(AuthLoading());
    var result = await authRepo.signUp(
        username: username, email: email, password: password, phone: phone);
    result.fold((failure) {
      if (failure is ServerFailure) {
        emit(AuthServerFailure(failure.errorMessage));
      } else if (failure is NetworkFailure) {
        emit(AuthNetworkFailure(failure.errorMessage));
      }
    }, (data) {
      if (data["status"] == "failure") {
        emit(AuthFailure(data["message"]));
      } else {
        emit(AuthSuccess());
      }
    });
  }
}
