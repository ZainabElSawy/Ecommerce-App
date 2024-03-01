import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';
import 'package:ecommerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:hive/hive.dart';

import '../../../../core/errors/failure.dart';
import '../data_source/auth_data_source.dart';

class AuthRepoImp implements AuthRepo {
  final AuthDataSource authDataSource;
  AuthRepoImp(this.authDataSource);

  @override
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  }) async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        dynamic data =
            await authDataSource.login(email: email, password: password);
        if (data["status"] == "failure") {
          return left(DataFailure(data["message"]));
        } else {
          User user = User.fromJson(data['data']);
          saveUser(user);
          return right(user);
        }
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
        if (data["status"] == "failure") {
          return left(DataFailure(data["message"]));
        } else {
          return right(data['data']);
        }
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
  Future<Either<Failure, User>> verifyCodeSignUp(
      {required String email, required int verifyCode}) async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        dynamic data = await authDataSource.verifyCodeSignUp(
            email: email, verifyCode: verifyCode);
        if (data["status"] == "failure") {
          return left(DataFailure(data["message"]));
        } else {
          User user = User.fromJson(data['data'][0]);
          return right(user);
        }
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
  Future<Either<Failure, dynamic>> checkEmail({required String email}) async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        dynamic data = await authDataSource.checkEmail(email: email);
        if (data["status"] == "failure") {
          return left(DataFailure(data["message"]));
        } else {
          return right("Success");
        }
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
  Future<Either<Failure, dynamic>> resetPassword(
      {required String email, required String newPassword}) async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        dynamic data = await authDataSource.resetPassword(
            email: email, newPassword: newPassword);
        if (data["status"] == "failure") {
          return left(DataFailure(data["message"]));
        } else {
          return right("Success");
        }
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
  Future<Either<Failure, dynamic>> verifyCodeForgetPassword(
      {required String email, required int verifyCode}) async {
    ConnectivityResult connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      try {
        dynamic data = await authDataSource.verifyCodeForgetPassword(
            email: email, verifyCode: verifyCode);
        if (data["status"] == "failure") {
          return left(DataFailure(data["message"]));
        } else {
          return right("Success");
        }
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

void saveUser(User user) async {
  var userBox = await Hive.openBox<User>('userBox');
  await userBox.put('userKey', user);
}
