part of 'remove_item_from_favorite_cubit.dart';

@immutable
sealed class RemoveItemFromFavoriteState {}

final class RemoveItemFromFavoriteInitial extends RemoveItemFromFavoriteState {}

class RemoveItemFromFavoriteSuccess extends RemoveItemFromFavoriteState {}

class RemoveItemFromFavoriteServerFailure extends RemoveItemFromFavoriteState {
  final String errMessage;
  RemoveItemFromFavoriteServerFailure(this.errMessage);
}
