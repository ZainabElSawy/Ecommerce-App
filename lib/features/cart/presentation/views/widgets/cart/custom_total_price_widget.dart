import 'package:flutter/material.dart';

import '../../../../../../core/constant/color.dart';

class CustomTotalPriceWidget extends StatelessWidget {
  const CustomTotalPriceWidget({
    super.key,
    required this.price,
    required this.discount,
    required this.shipping,
    required this.totalPrice,
  });

  final String price;
  final String discount;
  final String shipping;
  final String totalPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColor.primarycolor, width: 1),
      ),
      child: Column(
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
                const Text("Discount", style: TextStyle(fontSize: 16)),
                Text(discount, style: const TextStyle(fontSize: 16)),
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
        ],
      ),
    );
  }
}



