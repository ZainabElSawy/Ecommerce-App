part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<ItemModel>? items;
  SearchSuccess(this.items);
}

class SearchServerFailure extends SearchState {
  final String errMessage;
  SearchServerFailure(this.errMessage);
}

class SearchNetworkFailure extends SearchState {
  final String errMessage;
  SearchNetworkFailure(this.errMessage);
}
