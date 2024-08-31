import 'package:ecommerce_app/features/address/data/models/address_model.dart';

abstract class AddressDataSource {
  Future<String> addAddress({
    required int userId,
    required String name,
    required String city,
    required String street,
    required double lat,
    required double long,
  });
  Future<String> deleteAddress({required int addressId});
  Future<List<AddressModel>> fetchAddresses({required int userId});
}
