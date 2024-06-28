import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';

abstract class CartRepo {
  Future<Either<Failure, String>> addToCart({required int itemId});
  Future<Either<Failure, String>> removeFromCart({required int itemId});
  Future<Either<Failure, String>> itemsCountCart({required int itemId});
  Future<Either<Failure, String>> viewCart({required int favId});
}
