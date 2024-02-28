part of 'verify_code_cubit.dart';

@immutable
sealed class VerifyCodeState {}

final class VerifyCodeInitial extends VerifyCodeState {}

class VerifyCodeLoading extends VerifyCodeState {}

class VerifyCodeSuccess extends VerifyCodeState {
  final User user;
  VerifyCodeSuccess(this.user);
}

class VerifyCodeServerFailure extends VerifyCodeState {
  final String errMessage;
  VerifyCodeServerFailure(this.errMessage);
}

class VerifyCodeNetworkFailure extends VerifyCodeState {
  final String errMessage;
  VerifyCodeNetworkFailure(this.errMessage);
}

class VerifyCodeFailure extends VerifyCodeState {
  final String errMessage;
  VerifyCodeFailure(this.errMessage);
}
