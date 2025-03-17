import 'package:flutter/material.dart';

import '../../../../../../core/constant/color.dart';

class CustomCheckoutButton extends StatelessWidget {
  const CustomCheckoutButton({
    super.key,
    this.onCheckout,
  });

  final void Function()? onCheckout;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: MaterialButton(
        color: AppColor.secondarycolor,
        textColor: AppColor.white,
        onPressed: onCheckout,
        child: const Text(
          "Checkout",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}