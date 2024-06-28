import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/data/data_source/auth_data_source_imp.dart';
import '../../features/auth/data/repos/auth_repo_imp.dart';
import '../../features/auth/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import '../../features/auth/presentation/manager/login_cubit/login_cubit.dart';
import '../../features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import '../../features/auth/presentation/manager/verify_code_cubit/verify_code_cubit.dart';
import '../../features/cart/data/datasources/cart_data_source.dart';
import '../../features/cart/data/repositories/cart_repo_imp.dart';
import '../../features/home/data/data_sources/home_local_datasource.dart';
import '../../features/home/data/data_sources/home_remote_datasource.dart';
import '../../features/home/data/repos/home_repo_imp.dart';
import '../../features/home/presentation/manager/add_to_cart_cubit/add_to_cart_cubit.dart';
import '../../features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import '../../features/home/presentation/manager/favorite_cubit/favorite_cubit.dart';
import '../../features/home/presentation/manager/items_cubit/items_cubit.dart';
import '../../features/home/presentation/manager/items_for_cat_cubit/items_for_category_cubit.dart';
import '../../features/home/presentation/manager/remove_item_from_fav_cubit/remove_item_from_favorite_cubit.dart';
import '../../features/language/presentation/view_models/locale_cubit/locale_cubit.dart';
import '../services/api_services.dart';

List<BlocProvider<dynamic>> providersList =[
        BlocProvider<LocaleCubit>(
          create: (BuildContext context) => LocaleCubit()..getSavedLanguage(),
        ),
        BlocProvider<SignUpCubit>(
          create: (BuildContext context) => SignUpCubit(
              AuthRepoImp(AuthDataSourceImp(ApiService(dio: Dio())))),
        ),
        BlocProvider<AddtoCartCubit>(
          create: (BuildContext context) => AddtoCartCubit(
              CartRepoImp(CartDataSourceImp(ApiService(dio: Dio())))),
        ),
        BlocProvider<VerifyCodeCubit>(
          create: (BuildContext context) => VerifyCodeCubit(
              AuthRepoImp(AuthDataSourceImp(ApiService(dio: Dio())))),
        ),
        BlocProvider<LoginCubit>(
          create: (BuildContext context) => LoginCubit(
              AuthRepoImp(AuthDataSourceImp(ApiService(dio: Dio())))),
        ),
        BlocProvider<ForgetPasswordCubit>(
          create: (BuildContext context) => ForgetPasswordCubit(
              AuthRepoImp(AuthDataSourceImp(ApiService(dio: Dio())))),
        ),
        BlocProvider<CategoriesCubit>(
          create: (BuildContext context) => CategoriesCubit(HomeRepoImp(
              homeRemoteDataSource:
                  HomeRemoteDataSourceImp(ApiService(dio: Dio())),
              homeLocalDataSource:
                  HomeLocalDataSourceImp(ApiService(dio: Dio()))))
            ..fetchCategories(),
        ),
        BlocProvider<ItemsCubit>(
            create: (BuildContext context) => ItemsCubit(HomeRepoImp(
                homeRemoteDataSource:
                    HomeRemoteDataSourceImp(ApiService(dio: Dio())),
                homeLocalDataSource:
                    HomeLocalDataSourceImp(ApiService(dio: Dio()))))
              ..fetchItems()),
        BlocProvider<ItemsForCategoryCubit>(
            create: (BuildContext context) => ItemsForCategoryCubit(HomeRepoImp(
                homeRemoteDataSource:
                    HomeRemoteDataSourceImp(ApiService(dio: Dio())),
                homeLocalDataSource:
                    HomeLocalDataSourceImp(ApiService(dio: Dio()))))),
        BlocProvider<FavoriteCubit>(
            create: (BuildContext context) => FavoriteCubit(HomeRepoImp(
                homeRemoteDataSource:
                    HomeRemoteDataSourceImp(ApiService(dio: Dio())),
                homeLocalDataSource:
                    HomeLocalDataSourceImp(ApiService(dio: Dio()))))),
        BlocProvider<RemoveItemFromFavoriteCubit>(
            create: (BuildContext context) => RemoveItemFromFavoriteCubit(
                HomeRepoImp(
                    homeRemoteDataSource:
                        HomeRemoteDataSourceImp(ApiService(dio: Dio())),
                    homeLocalDataSource:
                        HomeLocalDataSourceImp(ApiService(dio: Dio()))))),
      ];