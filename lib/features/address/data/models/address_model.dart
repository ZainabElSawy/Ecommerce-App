class AddressModel {
  int? addressId;
  int? addressUsersid;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  double? addressLat;
  double? addressLong;

  AddressModel({
    this.addressId,
    this.addressUsersid,
    this.addressName,
    this.addressCity,
    this.addressStreet,
    this.addressLat,
    this.addressLong,
  });

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressId = int.tryParse(json['address_id'].toString());
    addressUsersid = int.tryParse(json['address_usersid'].toString());
    addressName = json['address_name'] as String?;
    addressCity = json['address_city'] as String?;
    addressStreet = json['address_street'] as String?;
    addressLat = double.tryParse(json['address_lat'].toString());
    addressLong = double.tryParse(json['address_long'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address_id'] = addressId;
    data['address_usersid'] = addressUsersid;
    data['address_name'] = addressName;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    return data;
  }
}
