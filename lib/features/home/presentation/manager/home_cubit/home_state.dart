part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final HomeModel home;
  HomeSuccess(this.home);
}

class HomeServerFailure extends HomeState {
  final String errMessage;
  HomeServerFailure(this.errMessage);
}

class HomeNetworkFailure extends HomeState {
  final String errMessage;
  HomeNetworkFailure(this.errMessage);
}
