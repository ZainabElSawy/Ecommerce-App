import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:ecommerce_app/features/auth/domain/repos/auth_repo.dart';

import '../../../../core/errors/failure.dart';
import '../data_source/auth_data_source.dart';

class AuthRepoImp implements AuthRepo {
  final AuthDataSource authDataSource;
  AuthRepoImp(this.authDataSource);

  @override
  Future<Either<Failure, User>> login(
      {required String email, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, dynamic>> signUp({
    required String username,
    required String email,
    required String password,
    required String phone,
  }) async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        dynamic data = await authDataSource.signUp(
            email: email, username: username, password: password, phone: phone);
        return right(data);
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
