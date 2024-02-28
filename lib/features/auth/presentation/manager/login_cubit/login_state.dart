part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final User user;
  LoginSuccess(this.user);
}

class LoginServerFailure extends LoginState {
  final String errMessage;
  LoginServerFailure(this.errMessage);
}

class LoginNetworkFailure extends LoginState {
  final String errMessage;
  LoginNetworkFailure(this.errMessage);
}

class LoginFailure extends LoginState {
  final String errMessage;
  LoginFailure(this.errMessage);
}
