import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/auth/data/models/user_model.dart';

import '../../../../core/errors/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  });
  Future<Either<Failure, dynamic>> signUp({
    required String username,
    required String email,
    required String password,
    required String phone,
  });
  Future<Either<Failure, User>> verifyCodeSignUp({
    required String email,
    required int verifyCode,
  });
}
