import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/address/data/models/address_model.dart';
import '../../../../core/errors/failure.dart';

abstract class AddressRepo {
  Future<Either<Failure, String>> addAddress({
    required String name,
    required String city,
    required String street,
    required double lat,
    required double long,
  });
  Future<Either<Failure, String>> deleteAddress({required int addressId});
  Future<Either<Failure, List<AddressModel>>> fetchAddress();
}
