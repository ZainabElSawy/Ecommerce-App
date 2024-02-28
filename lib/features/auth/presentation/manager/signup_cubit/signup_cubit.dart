import 'package:ecommerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';
part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  AuthRepo authRepo;
  signUp({
    required String username,
    required String email,
    required String password,
    required String phone,
  }) async {
    emit(SignUpLoading());
    var result = await authRepo.signUp(
        username: username, email: email, password: password, phone: phone);
    result.fold((failure) {
      if (failure is ServerFailure) {
        emit(SignUpServerFailure(failure.errorMessage));
      } else if (failure is NetworkFailure) {
        emit(SignUpNetworkFailure(failure.errorMessage));
      } else if (failure is DataFailure) {
        emit(SignUpFailure(failure.errorMessage));
      }
    }, (data) {
      emit(SignUpSuccess());
    });
  }
}
