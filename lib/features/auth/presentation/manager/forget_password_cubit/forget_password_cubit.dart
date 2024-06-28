import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/repos/auth_repo.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.authRepo) : super(ForgetPasswordInitial());
  String code = "";
  AuthRepo authRepo;
  checkEmail({required String email})async{
    emit(ForgetPasswordLoading());
    var result = await authRepo.checkEmail(email: email);
    result.fold((failure) {
      if (failure is ServerFailure) {
        emit(ForgetPasswordServerFailure(failure.errorMessage));
      } else if (failure is NetworkFailure) {
        emit(ForgetPasswordNetworkFailure(failure.errorMessage));
      } else if (failure is DataFailure) {
        emit(ForgetPasswordFailure(failure.errorMessage));
      }
    }, (data) {
      emit(ForgetPasswordSuccess());
    });
  }
  verifyCode({required String email,required int verifyCode})async{
    emit(ForgetPasswordLoading());
    var result = await authRepo.verifyCodeForgetPassword(email: email, verifyCode: verifyCode);
    result.fold((failure) {
      if (failure is ServerFailure) {
        emit(ForgetPasswordServerFailure(failure.errorMessage));
      } else if (failure is NetworkFailure) {
        emit(ForgetPasswordNetworkFailure(failure.errorMessage));
      } else if (failure is DataFailure) {
        emit(ForgetPasswordFailure(failure.errorMessage));
      }
    }, (data) {
      emit(ForgetPasswordSuccess());
    });
  }
  resetPassword({required String email,required String newPassword})async{
    emit(ForgetPasswordLoading());
    var result = await authRepo.resetPassword(email: email, newPassword: newPassword);
    result.fold((failure) {
      if (failure is ServerFailure) {
        emit(ForgetPasswordServerFailure(failure.errorMessage));
      } else if (failure is NetworkFailure) {
        emit(ForgetPasswordNetworkFailure(failure.errorMessage));
      } else if (failure is DataFailure) {
        emit(ForgetPasswordFailure(failure.errorMessage));
      }
    }, (data) {
      emit(ForgetPasswordSuccess());
    });
  }
  resendOTP({required String userEmail}) async {
    await authRepo.otpResend(userEmail: userEmail);
  }
}
