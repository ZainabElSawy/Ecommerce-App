part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthServerFailure extends AuthState {
  final String errMessage;
  AuthServerFailure(this.errMessage);
}

class AuthNetworkFailure extends AuthState {
  final String errMessage;
  AuthNetworkFailure(this.errMessage);
}
class AuthFailure extends AuthState {
  final String errMessage;
  AuthFailure(this.errMessage);
}
