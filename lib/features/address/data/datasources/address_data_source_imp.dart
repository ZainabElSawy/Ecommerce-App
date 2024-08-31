import 'dart:developer';

import 'package:ecommerce_app/features/address/data/models/address_model.dart';

import '../../../../core/constant/linkapi.dart';
import '../../../../core/services/api_services.dart';
import 'address_data_source.dart';

class AddressDataSourceImp extends AddressDataSource {
  final ApiService apiService;

  AddressDataSourceImp(this.apiService);

  @override
  Future<String> addAddress({
    required int userId,
    required String name,
    required String city,
    required String street,
    required double lat,
    required double long,
  }) async {
    Map<String, dynamic> data =
        await apiService.post(endPoint: AppLinks.addressAdd, data: {
      "address_usersid": userId,
      "address_name": name,
      "address_city": city,
      "address_street": street,
      "address_lat": lat,
      "address_long": long,
    });
    return data["status"];
  }

  @override
  Future<List<AddressModel>> fetchAddresses({required int userId}) async {
    Map<String, dynamic> data =
        await apiService.post(endPoint: AppLinks.addressView, data: {
      "address_usersid": userId,
    });
    List<AddressModel> addresses;
    if (data["status"] == "failure") {
      addresses = [];
    } else {
      addresses = getAddressesList(data["data"]);
    }

    return addresses;
  }

  @override
  Future<String> deleteAddress({required int addressId}) async {
    Map<String, dynamic> data =
        await apiService.post(endPoint: AppLinks.addressDelete, data: {
      "address_id": addressId,
    });
    log("${data["status"]}");
    return data["status"];
  }
}

List<AddressModel> getAddressesList(List data) {
  List<AddressModel> addresses = [];
  for (var address in data) {
    addresses.add(AddressModel.fromJson(address));
  }
  return addresses;
}
