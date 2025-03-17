import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/features/home/data/models/categories_model.dart';
import 'package:ecommerce_app/features/home/data/models/item_model.dart';
import 'package:ecommerce_app/features/home/data/models/my_favorite_model.dart';
import 'package:ecommerce_app/features/home/data/models/settings_model.dart';
import 'package:ecommerce_app/main.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/repos/home_repo.dart';
import '../data_sources/home_local_datasource.dart';
import '../data_sources/home_remote_datasource.dart';
import '../models/home_model/home_model.dart';
import '../models/notification_model.dart';

class HomeRepoImp implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;
  HomeRepoImp({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });

  @override
  Future<Either<Failure, List<CategoriesModel>>> fetchCategories() async {
    List<CategoriesModel> categories;
    categories = homeLocalDataSource.fetchCategories();
    if (categories.isNotEmpty) return right(categories);
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
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
        // items = homeLocalDataSource.fetchItems();
        // if (items.isNotEmpty) return right(items);
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

  @override
  Future<Either<Failure, List<ItemModel>?>> search(String srch) async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        List<ItemModel>? items;
        items = await homeRemoteDataSource.search(srch);
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
  Future<Either<Failure, List<NotificationsModel>?>>
      fetchAllNotifications() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        List<NotificationsModel>? notifications = await homeRemoteDataSource
            .fetchAllNotifications(sharedPreferences!.getInt("userid")!);
        return right(notifications);
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
  Future<Either<Failure, List<ItemModel>?>> fetchOffers() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        log("fetchOffers ");
        List<ItemModel>? items;
        items = await homeRemoteDataSource.fetchOffers();
        return right(items);
      } catch (e) {
        // ignore: deprecated_member_use
        if (e is DioError) {
          log(e.toString());
          return left(ServerFailure.fromDioError(e));
        }
        log(e.toString());

        return left(ServerFailure(e.toString()));
      }
    } else {
      return left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, SettingsModel>> fetchSettings() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        SettingsModel settingsModel;
        settingsModel = await homeRemoteDataSource.fetchSettings();
        return right(settingsModel);
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
  Future<Either<Failure, HomeModel>> fetchHomeContent() async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        HomeModel homeModel;
        homeModel = await homeRemoteDataSource.fetchHomeContent();
        return right(homeModel);
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
