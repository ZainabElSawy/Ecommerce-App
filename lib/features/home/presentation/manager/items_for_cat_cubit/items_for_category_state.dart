part of 'items_for_category_cubit.dart';

@immutable
sealed class ItemsForCategoryState {}

final class ItemsForCategoryInitial extends ItemsForCategoryState {}

class ItemsForCategoryLoading extends ItemsForCategoryState {}

class ItemsForCategorySuccess extends ItemsForCategoryState {
  final List<ItemModel> items;
  ItemsForCategorySuccess(this.items);
}

class ItemsForCategoryServerFailure extends ItemsForCategoryState {
  final String errMessage;
  ItemsForCategoryServerFailure(this.errMessage);
}

class ItemsForCategoryNetworkFailure extends ItemsForCategoryState {
  final String errMessage;
  ItemsForCategoryNetworkFailure(this.errMessage);
}