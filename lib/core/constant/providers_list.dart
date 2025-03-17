import 'package:dio/dio.dart';
import 'package:ecommerce_app/features/address/data/datasources/address_data_source_imp.dart';
import 'package:ecommerce_app/features/cart/presentation/manager/coupon_cubit/coupon_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/address/data/repositories/address_repo_imp.dart';
import '../../features/address/presentation/manager/add_delete_address_cubit/address_cubit.dart';
import '../../features/address/presentation/manager/view_address_cubit/view_address_cubit.dart';
import '../../features/auth/data/data_source/auth_data_source_imp.dart';
import '../../features/auth/data/repos/auth_repo_imp.dart';
import '../../features/auth/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import '../../features/auth/presentation/manager/login_cubit/login_cubit.dart';
import '../../features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import '../../features/auth/presentation/manager/verify_code_cubit/verify_code_cubit.dart';
import '../../features/cart/data/datasources/cart_data_source.dart';
import '../../features/cart/data/repositories/cart_repo_imp.dart';
import '../../features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import '../../features/cart/presentation/manager/checkout_cubit/checkout_cubit.dart';
import '../../features/home/presentation/manager/settings_cubit/settings_cubit.dart';
import '../../features/orders/presentation/manager/delete_order_cubit/delete_order_cubit.dart';
import '../../features/orders/presentation/manager/order_details_cubit/order_details_cubit.dart';
import '../../features/orders/presentation/manager/order_cubit/pending_orders_cubit.dart';
import '../../features/home/data/data_sources/home_local_datasource.dart';
import '../../features/home/data/data_sources/home_remote_datasource.dart';
import '../../features/home/data/repos/home_repo_imp.dart';
import '../../features/home/presentation/manager/add_to_cart_cubit/add_to_cart_cubit.dart';
import '../../features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import '../../features/home/presentation/manager/favorite_cubit/favorite_cubit.dart';
import '../../features/home/presentation/manager/items_cubit/items_cubit.dart';
import '../../features/home/presentation/manager/items_for_cat_cubit/items_for_category_cubit.dart';
import '../../features/home/presentation/manager/notifications_cubit/notifications_cubit.dart';
import '../../features/home/presentation/manager/remove_item_from_fav_cubit/remove_item_from_favorite_cubit.dart';
import '../../features/language/presentation/view_models/locale_cubit/locale_cubit.dart';
import '../../features/orders/data/datasource/orders_datatsource.dart';
import '../../features/orders/data/repository/orders_repo_imp.dart';
import '../../features/orders/presentation/manager/update_rating_cubit/update_rating_cubit.dart';
import '../services/api_services.dart';

List<BlocProvider<dynamic>> providersList = [
  BlocProvider<UpdateRatingCubit>(
    create: (BuildContext context) => UpdateRatingCubit(
        OrdersRepoImp(OrdersDataSourceImp(ApiService(dio: Dio())))),
  ),
  BlocProvider<DeleteOrderCubit>(
    create: (BuildContext context) => DeleteOrderCubit(
        OrdersRepoImp(OrdersDataSourceImp(ApiService(dio: Dio())))),
  ),
  BlocProvider<OrdersCubit>(
    create: (BuildContext context) =>
        OrdersCubit(OrdersRepoImp(OrdersDataSourceImp(ApiService(dio: Dio())))),
  ),
  BlocProvider<OrderDetailsCubit>(
    create: (BuildContext context) => OrderDetailsCubit(
        OrdersRepoImp(OrdersDataSourceImp(ApiService(dio: Dio())))),
  ),
  BlocProvider<AddressCubit>(
    create: (BuildContext context) => AddressCubit(
        AddressRepoImp(AddressDataSourceImp(ApiService(dio: Dio())))),
  ),
  BlocProvider<ViewAddressCubit>(
    create: (BuildContext context) => ViewAddressCubit(
        AddressRepoImp(AddressDataSourceImp(ApiService(dio: Dio())))),
  ),
  BlocProvider<LocaleCubit>(
    create: (BuildContext context) => LocaleCubit()..getSavedLanguage(),
  ),
  BlocProvider<SignUpCubit>(
    create: (BuildContext context) =>
        SignUpCubit(AuthRepoImp(AuthDataSourceImp(ApiService(dio: Dio())))),
  ),
  BlocProvider<AddtoCartCubit>(
    create: (BuildContext context) =>
        AddtoCartCubit(CartRepoImp(CartDataSourceImp(ApiService(dio: Dio())))),
  ),
  BlocProvider<VerifyCodeCubit>(
    create: (BuildContext context) =>
        VerifyCodeCubit(AuthRepoImp(AuthDataSourceImp(ApiService(dio: Dio())))),
  ),
  BlocProvider<LoginCubit>(
    create: (BuildContext context) =>
        LoginCubit(AuthRepoImp(AuthDataSourceImp(ApiService(dio: Dio())))),
  ),
  BlocProvider<CartCubit>(
    create: (BuildContext context) =>
        CartCubit(CartRepoImp(CartDataSourceImp(ApiService(dio: Dio())))),
  ),
  BlocProvider<CheckoutCubit>(
    create: (BuildContext context) =>
        CheckoutCubit(CartRepoImp(CartDataSourceImp(ApiService(dio: Dio())))),
  ),
  BlocProvider<CouponCubit>(
    create: (BuildContext context) =>
        CouponCubit(CartRepoImp(CartDataSourceImp(ApiService(dio: Dio())))),
  ),
  BlocProvider<ForgetPasswordCubit>(
    create: (BuildContext context) => ForgetPasswordCubit(
        AuthRepoImp(AuthDataSourceImp(ApiService(dio: Dio())))),
  ),
  BlocProvider<CategoriesCubit>(
    create: (BuildContext context) => CategoriesCubit(HomeRepoImp(
        homeRemoteDataSource: HomeRemoteDataSourceImp(ApiService(dio: Dio())),
        homeLocalDataSource: HomeLocalDataSourceImp(ApiService(dio: Dio()))))
      ..fetchCategories(),
  ),
  BlocProvider<NotificationsCubit>(
    create: (BuildContext context) => NotificationsCubit(HomeRepoImp(
        homeRemoteDataSource: HomeRemoteDataSourceImp(ApiService(dio: Dio())),
        homeLocalDataSource: HomeLocalDataSourceImp(ApiService(dio: Dio())))),
  ),
  BlocProvider<ItemsCubit>(
      create: (BuildContext context) => ItemsCubit(HomeRepoImp(
          homeRemoteDataSource: HomeRemoteDataSourceImp(ApiService(dio: Dio())),
          homeLocalDataSource: HomeLocalDataSourceImp(ApiService(dio: Dio()))))
        ..fetchItems()),
  BlocProvider<ItemsForCategoryCubit>(
      create: (BuildContext context) => ItemsForCategoryCubit(HomeRepoImp(
          homeRemoteDataSource: HomeRemoteDataSourceImp(ApiService(dio: Dio())),
          homeLocalDataSource:
              HomeLocalDataSourceImp(ApiService(dio: Dio()))))),
  BlocProvider<SettingsCubit>(
      create: (BuildContext context) => SettingsCubit(HomeRepoImp(
          homeRemoteDataSource: HomeRemoteDataSourceImp(ApiService(dio: Dio())),
          homeLocalDataSource: HomeLocalDataSourceImp(ApiService(dio: Dio()))))
        ..fetchSettings()),
  BlocProvider<FavoriteCubit>(
      create: (BuildContext context) => FavoriteCubit(HomeRepoImp(
          homeRemoteDataSource: HomeRemoteDataSourceImp(ApiService(dio: Dio())),
          homeLocalDataSource:
              HomeLocalDataSourceImp(ApiService(dio: Dio()))))),
  BlocProvider<RemoveItemFromFavoriteCubit>(
    create: (BuildContext context) => RemoveItemFromFavoriteCubit(
      HomeRepoImp(
        homeRemoteDataSource: HomeRemoteDataSourceImp(ApiService(dio: Dio())),
        homeLocalDataSource: HomeLocalDataSourceImp(ApiService(dio: Dio())),
      ),
    ),
  ),
  BlocProvider<SearchCubit>(
    create: (BuildContext context) => SearchCubit(
      HomeRepoImp(
        homeRemoteDataSource: HomeRemoteDataSourceImp(ApiService(dio: Dio())),
        homeLocalDataSource: HomeLocalDataSourceImp(ApiService(dio: Dio())),
      ),
    ),
  ),
];
