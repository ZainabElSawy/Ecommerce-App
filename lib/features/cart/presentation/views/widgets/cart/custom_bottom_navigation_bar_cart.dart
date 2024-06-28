import 'package:flutter/material.dart';

import '../../../../../../core/constant/color.dart';
import 'button_cart.dart';

class CustomButtomNavigationbarCart extends StatelessWidget {
  const CustomButtomNavigationbarCart({
    Key? key,
    required this.price,
    required this.totalPrice,
    required this.shipping,
  }) : super(key: key);
  final String price;
  final String totalPrice;
  final String shipping;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Price", style: TextStyle(fontSize: 16)),
              Text(price, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Shipping", style: TextStyle(fontSize: 16)),
              Text(shipping, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Divider(),
        ),
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total Price",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColor.primarycolor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                totalPrice,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColor.primarycolor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        CustomButtonCart(textbutton: 'Place Order', onPressed: () {})
      ],
    );
  }
}
