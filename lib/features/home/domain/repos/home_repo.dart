import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/home/data/models/categories_model.dart';
import 'package:ecommerce_app/features/home/data/models/item_model.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/my_favorite_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CategoriesModel>>> fetchCategories();
  Future<Either<Failure, List<ItemModel>>> fetchItems();
  Future<Either<Failure, List<ItemModel>>> fetchAllItemsData({required int catId});
  Future<Either<Failure, String>> addToFavorite({required int itemId});
  Future<Either<Failure, String>> removeFromFavorite({required int itemId});
  Future<Either<Failure, String>> removeItemFromFavorite({required int favId});
  Future<Either<Failure, List<MyFavoriteModel>>> fetchMyFavoriteItems();
  Future<Either<Failure, List<ItemModel>?>> search(String srch);

}
