import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/features/home/data/models/categories_model.dart';
import 'package:ecommerce_app/features/home/data/models/item_model.dart';
import 'package:ecommerce_app/features/home/data/models/my_favorite_model.dart';
import 'package:ecommerce_app/main.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/repos/home_repo.dart';
import '../data_sources/home_local_datasource.dart';
import '../data_sources/home_remote_datasource.dart';

class HomeRepoImp implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;
  HomeRepoImp({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });

  @override
  Future<Either<Failure, List<CategoriesModel>>> fetchCategories() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        List<CategoriesModel> categories;
        categories = homeLocalDataSource.fetchCategories();
        if (categories.isNotEmpty) return right(categories);
        categories = await homeRemoteDataSource.fetchCategories();
        return right(categories);
      } catch (e) {
        // ignore: deprecated_member_use
        if (e is DioError) {
          return left(ServerFailure.fromDioError(e));
        }
        return left(ServerFailure(e.toString()));
      }
    } else {
      return left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<ItemModel>>> fetchItems() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        List<ItemModel> items;
        items = homeLocalDataSource.fetchItems();
        if (items.isNotEmpty) return right(items);
        items = await homeRemoteDataSource.fetchItems();
        return right(items);
      } catch (e) {
        // ignore: deprecated_member_use
        if (e is DioError) {
          return left(ServerFailure.fromDioError(e));
        }
        return left(ServerFailure(e.toString()));
      }
    } else {
      return left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<ItemModel>>> fetchAllItemsData(
      {required int catId}) async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        List<ItemModel>? items;
        items = await homeRemoteDataSource.fetchAllItemData(
            catId: catId, usersId: sharedPreferences!.getInt("userid")!);
        return right(items ?? []);
      } catch (e) {
        // ignore: deprecated_member_use
        if (e is DioError) {
          return left(ServerFailure.fromDioError(e));
        }
        return left(ServerFailure(e.toString()));
      }
    } else {
      return left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, String>> addToFavorite({required int itemId}) async {
    try {
      String status = await homeRemoteDataSource.addToFavorite(
          userId: sharedPreferences!.getInt("userid")!, itemId: itemId);
      if (status == "success") {
        return right(status);
      } else {
        return left(
            ServerFailure("Something went wrong ,please try again later!"));
      }
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> removeFromFavorite(
      {required int itemId}) async {
    try {
      String status = await homeRemoteDataSource.removeFromFavorite(
          userId: sharedPreferences!.getInt("userid")!, itemId: itemId);
      if (status == "success") {
        return right(status);
      } else {
        return left(
            ServerFailure("Something went wrong ,please try again later!"));
      }
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> removeItemFromFavorite(
      {required int favId}) async {
    try {
      String status =
          await homeRemoteDataSource.removeItemFromFavorite(favId: favId);
      if (status == "success") {
        return right(status);
      } else {
        return left(
            ServerFailure("Something went wrong ,please try again later!"));
      }
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MyFavoriteModel>>> fetchMyFavoriteItems() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        List<MyFavoriteModel> favoriteItems;
        favoriteItems = await homeRemoteDataSource.fetchMyFavoriteItems(
          userId: sharedPreferences!.getInt("userid")!,
        );
        return right(favoriteItems);
      } catch (e) {
        // ignore: deprecated_member_use
        if (e is DioError) {
          return left(ServerFailure.fromDioError(e));
        }
        return left(ServerFailure(e.toString()));
      }
    } else {
      return left(NetworkFailure('No internet connection'));
    }
  }

}
