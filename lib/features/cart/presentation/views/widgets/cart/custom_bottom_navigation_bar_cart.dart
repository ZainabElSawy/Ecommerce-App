import 'package:flutter/material.dart';

import 'custom_button_cart.dart';
import 'custom_coupon_widget.dart';
import 'custom_total_price_widget.dart';

class CustomButtomNavigationbarCart extends StatelessWidget {
  const CustomButtomNavigationbarCart({
    Key? key,
    required this.price,
    required this.totalPrice,
    required this.discount,
    required this.controllercoupon,
    this.onApplyCoupon,
    required this.shipping,
  }) : super(key: key);
  final String price;
  final String totalPrice;
  final String discount;
  final String shipping;
  final TextEditingController controllercoupon;
  final void Function()? onApplyCoupon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomCouponWidget(controllercoupon: controllercoupon, onApplyCoupon: onApplyCoupon),
        CustomTotalPriceWidget(price: price, discount: discount, shipping: shipping, totalPrice: totalPrice),
        CustomButtonCart(textbutton: 'Place Order', onPressed: () {})
      ],
    );
  }
}

