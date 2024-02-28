part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetPasswordState {}


class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordSuccess extends ForgetPasswordState {}

class ForgetPasswordServerFailure extends ForgetPasswordState {
  final String errMessage;
  ForgetPasswordServerFailure(this.errMessage);
}

class ForgetPasswordNetworkFailure extends ForgetPasswordState {
  final String errMessage;
  ForgetPasswordNetworkFailure(this.errMessage);
}
class ForgetPasswordFailure extends ForgetPasswordState {
  final String errMessage;
  ForgetPasswordFailure(this.errMessage);
}
