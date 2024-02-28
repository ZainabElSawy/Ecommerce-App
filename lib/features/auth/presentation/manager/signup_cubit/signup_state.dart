part of 'signup_cubit.dart';

@immutable
sealed class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {}

class SignUpServerFailure extends SignUpState {
  final String errMessage;
  SignUpServerFailure(this.errMessage);
}

class SignUpNetworkFailure extends SignUpState {
  final String errMessage;
  SignUpNetworkFailure(this.errMessage);
}
class SignUpFailure extends SignUpState {
  final String errMessage;
  SignUpFailure(this.errMessage);
}
