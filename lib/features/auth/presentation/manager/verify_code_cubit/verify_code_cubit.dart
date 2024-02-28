import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/models/user_model.dart';

part 'verify_code_state.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  VerifyCodeCubit(this.authRepo) : super(VerifyCodeInitial());
  String verifyCode = "";
  AuthRepo authRepo;
  verifyCodeSignUp({
    required String email,
    required int verifyCode,
  }) async {
    emit(VerifyCodeLoading());
    var result =
        await authRepo.verifyCodeSignUp(email: email, verifyCode: verifyCode);
    result.fold((failure) {
      if (failure is ServerFailure) {
        emit(VerifyCodeServerFailure(failure.errorMessage));
      } else if (failure is NetworkFailure) {
        emit(VerifyCodeNetworkFailure(failure.errorMessage));
      } else if (failure is DataFailure) {
        emit(VerifyCodeFailure(failure.errorMessage));
      }
    }, (user) {
      emit(VerifyCodeSuccess(user));
    });
  }
}
