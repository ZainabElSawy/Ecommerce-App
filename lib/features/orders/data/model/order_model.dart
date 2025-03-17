class OrderModel {
  int? ordersUsersid;
  int? ordersId;
  int? ordersAddress;
  int? ordersType;
  int? ordersPricedelivery;
  int? ordersPrice;
  int? ordersCoupon;
  int? ordersRating;
  String? ordersNoterating;
  int? ordersTotalprice;
  int? ordersPaymentmethod;
  int? ordersStatus;
  String? ordersDatetime;
  int? addressId;
  int? addressUsersid;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  double? addressLat;
  double? addressLong;

  OrderModel({
    this.ordersId,
    this.ordersUsersid,
    this.ordersAddress,
    this.ordersType,
    this.ordersPricedelivery,
    this.ordersPrice,
    this.ordersCoupon,
    this.ordersRating,
    this.ordersNoterating,
    this.ordersTotalprice,
    this.ordersPaymentmethod,
    this.ordersStatus,
    this.ordersDatetime,
    this.addressId,
    this.addressUsersid,
    this.addressName,
    this.addressCity,
    this.addressStreet,
    this.addressLat,
    this.addressLong,
  });

  OrderModel.fromJson(Map<String, dynamic> json) {
    ordersId = int.tryParse(json['orders_id'].toString());
    ordersUsersid = int.tryParse(json['orders_usersid'].toString());
    ordersAddress = int.tryParse(json['orders_address'].toString());
    ordersType = int.tryParse(json['orders_type'].toString());
    ordersPricedelivery = int.tryParse(json['orders_pricedelivery'].toString());
    ordersPrice = int.tryParse(json['orders_price'].toString());
    ordersCoupon = int.tryParse(json['orders_coupon'].toString());
    ordersRating = int.tryParse(json['orders_rating'].toString());
    ordersNoterating = json['orders_noterating'] as String?;
    ordersTotalprice = int.tryParse(json['orders_totalprice'].toString());
    ordersPaymentmethod = int.tryParse(json['orders_paymentmethod'].toString());
    ordersStatus = int.tryParse(json['orders_status'].toString());
    ordersDatetime = json['orders_datetime'] as String?;
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
    data['orders_id'] = ordersId;
    data['orders_usersid'] = ordersUsersid;
    data['orders_address'] = ordersAddress;
    data['orders_type'] = ordersType;
    data['orders_pricedelivery'] = ordersPricedelivery;
    data['orders_price'] = ordersPrice;
    data['orders_coupon'] = ordersCoupon;
    data['orders_rating'] = ordersRating;
    data['orders_noterating'] = ordersNoterating;
    data['orders_totalprice'] = ordersTotalprice;
    data['orders_paymentmethod'] = ordersPaymentmethod;
    data['orders_status'] = ordersStatus;
    data['orders_datetime'] = ordersDatetime;
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
