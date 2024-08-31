import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/cart/data/models/coupon_model.dart';
import '../../../../core/errors/failure.dart';
import '../../data/models/cart_model.dart';

abstract class CartRepo {
  Future<Either<Failure, String>> addToCart({required int itemId});
  Future<Either<Failure, String>> removeFromCart({required int itemId});
  Future<Either<Failure, String>> itemsCountCart({required int itemId});
  Future<Either<Failure, CartModel>> viewCart();
  Future<Either<Failure, CouponModel>> checkCoupon({required String couponName});
}
