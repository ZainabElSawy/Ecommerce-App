import 'package:flutter/material.dart';

import 'custom_button_coupon.dart';

class CustomCouponRow extends StatelessWidget {
  const CustomCouponRow({
    super.key,
    required this.controllercoupon,
    required this.onApplyCoupon,
  });

  final TextEditingController controllercoupon;
  final void Function()? onApplyCoupon;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Expanded(
            flex: 2,
            child: TextFormField(
              controller: controllercoupon,
              decoration: const InputDecoration(
                isDense: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                hintText: "Coupon Code",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            flex: 1,
            child: CustomButtonCoupon(
              textbutton: 'Apply',
              onPressed: onApplyCoupon,
            ),
          ),
        ],
      );
  }
}
