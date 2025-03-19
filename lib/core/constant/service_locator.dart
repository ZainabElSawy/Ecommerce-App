import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../services/api_services.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  // getIt.registerSingleton<HomeRemoteDataSource>(
  //     HomeRemoteDataSourceImp(getIt.get<ApiService>()));
  // getIt.registerSingleton<HomeLocalDataSource>(HomeLocalDataSourceImp());
  // getIt.registerSingleton<HomeRepo>(HomeRepoImp(
  //     homeRemoteDataSource: getIt.get<HomeRemoteDataSource>(),
  //     homeLocalDataSource: getIt.get<HomeLocalDataSource>()));

  // getIt.registerSingleton<ProductRemoteDataSource>(
  //     ProductRemoteDataSourceImp(getIt.get<ApiService>()));
  // getIt.registerSingleton<ProductRepo>(
  //   ProductRepoImp(
  //     productRemoteDataSource: getIt.get<ProductRemoteDataSource>(),
  //   ),
  // );

  // getIt.registerSingleton<CartRemoteDataSource>(
  //     CartRemoteDataSourceImp(getIt.get<ApiService>()));
  // getIt.registerSingleton<CartRepo>(
  //   CartRepoImp(
  //     productRemoteDataSource: getIt.get<ProductRemoteDataSource>(),
  //     cartRemoteDataSource: getIt.get<CartRemoteDataSource>(),
  //   ),
  // );
}
