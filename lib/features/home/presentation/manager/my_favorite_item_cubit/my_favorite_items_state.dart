part of 'my_favorite_items_cubit.dart';

@immutable
sealed class MyFavoriteItemsState {}

final class MyFavoriteItemsInitial extends MyFavoriteItemsState {}
class MyFavoriteItemsLoading extends MyFavoriteItemsState {}

class MyFavoriteItemsSuccess extends MyFavoriteItemsState {
  final List<MyFavoriteModel> favItem;
  MyFavoriteItemsSuccess(this.favItem);
}

class MyFavoriteItemsServerFailure extends MyFavoriteItemsState {
  final String errMessage;
  MyFavoriteItemsServerFailure(this.errMessage);
}

class MyFavoriteItemsNetworkFailure extends MyFavoriteItemsState {
  final String errMessage;
  MyFavoriteItemsNetworkFailure(this.errMessage);
}
