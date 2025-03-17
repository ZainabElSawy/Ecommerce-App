class CouponModel {
  int? couponId;
  String? couponName;
  int? couponCount;
  int? couponDiscount;
  String? couponExpiredate;

  CouponModel({
    this.couponId,
    this.couponName,
    this.couponCount,
    this.couponDiscount,
    this.couponExpiredate,
  });

  // Factory constructor to convert JSON to CouponModel
  factory CouponModel.fromJson(Map<String, dynamic> json) {
    return CouponModel(
      couponId: int.tryParse(json['coupon_id'].toString()) ?? 0,
      couponName: json['coupon_name'],
      couponCount: int.tryParse(json['coupon_count'].toString()) ?? 0,
      couponDiscount: int.tryParse(json['coupon_discount'].toString()) ?? 0,
      couponExpiredate: json['coupon_expiredate'],
    );
  }

  // Method to convert CouponModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'coupon_id': couponId,
      'coupon_name': couponName,
      'coupon_count': couponCount,
      'coupon_discount': couponDiscount,
      'coupon_expiredate': couponExpiredate,
    };
  }
}
