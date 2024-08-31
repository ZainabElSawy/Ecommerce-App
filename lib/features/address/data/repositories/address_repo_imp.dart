import 'package:dartz/dartz.dart';

import 'package:dio/dio.dart';
import 'package:ecommerce_app/features/address/data/models/address_model.dart';
import 'package:ecommerce_app/features/address/domain/repositories/address_repo.dart';
import 'package:ecommerce_app/main.dart';

import '../../../../core/errors/failure.dart';
import '../datasources/address_data_source.dart';

class AddressRepoImp implements AddressRepo {
  final AddressDataSource addressDataSource;
  AddressRepoImp(this.addressDataSource);

  @override
  Future<Either<Failure, String>> addAddress({
    required String name,
    required String city,
    required String street,
    required double lat,
    required double long,
  }) async {
    try {
      String status = await addressDataSource.addAddress(
        userId: sharedPreferences!.getInt("userid")!,
        name: name,
        city: city,
        street: street,
        lat: lat,
        long: long,
      );
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
  Future<Either<Failure, List<AddressModel>>> fetchAddress() async {
    try {
      List<AddressModel> addresses = await addressDataSource.fetchAddresses(
        userId: sharedPreferences!.getInt("userid")!,
      );

      return right(addresses);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteAddress(
      {required int addressId}) async {
    try {
      String status =
          await addressDataSource.deleteAddress(addressId: addressId);
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
}
