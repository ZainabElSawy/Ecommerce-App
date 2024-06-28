part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesSuccess extends CategoriesState {
  final List<CategoriesModel> categories;
  CategoriesSuccess(this.categories);
}

class CategoriesServerFailure extends CategoriesState {
  final String errMessage;
  CategoriesServerFailure(this.errMessage);
}

class CategoriesNetworkFailure extends CategoriesState {
  final String errMessage;
  CategoriesNetworkFailure(this.errMessage);
}
