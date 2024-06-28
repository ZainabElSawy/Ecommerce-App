part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteSuccess extends FavoriteState {}

class FavoriteServerFailure extends FavoriteState {
  final String errMessage;
  FavoriteServerFailure(this.errMessage);
}
