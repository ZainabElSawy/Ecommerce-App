part of 'items_cubit.dart';

@immutable
sealed class ItemsState {}

class ItemsInitial extends ItemsState {}

class ItemsLoading extends ItemsState {}

class ItemsSuccess extends ItemsState {
  final List<ItemModel> items;
  ItemsSuccess(this.items);
}

class ItemsServerFailure extends ItemsState {
  final String errMessage;
  ItemsServerFailure(this.errMessage);
}

class ItemsNetworkFailure extends ItemsState {
  final String errMessage;
  ItemsNetworkFailure(this.errMessage);
}
