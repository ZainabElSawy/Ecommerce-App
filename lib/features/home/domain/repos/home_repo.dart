import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/home/data/models/categories_model.dart';
import 'package:ecommerce_app/features/home/data/models/item_model.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/home_model/home_model.dart';
import '../../data/models/my_favorite_model.dart';
import '../../data/models/notification_model.dart';
import '../../data/models/settings_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CategoriesModel>>> fetchCategories();
  Future<Either<Failure, List<ItemModel>>> fetchItems();
  Future<Either<Failure, SettingsModel>> fetchSettings();
  Future<Either<Failure, List<ItemModel>>> fetchAllItemsData(
      {required int catId});
  Future<Either<Failure, String>> addToFavorite({required int itemId});
  Future<Either<Failure, String>> removeFromFavorite({required int itemId});
  Future<Either<Failure, String>> removeItemFromFavorite({required int favId});
  Future<Either<Failure, List<MyFavoriteModel>>> fetchMyFavoriteItems();
  Future<Either<Failure, List<ItemModel>?>> search(String srch);
  Future<Either<Failure, List<ItemModel>?>> fetchOffers();
  Future<Either<Failure, HomeModel>> fetchHomeContent();
  Future<Either<Failure, List<NotificationsModel>?>> fetchAllNotifications();
}
