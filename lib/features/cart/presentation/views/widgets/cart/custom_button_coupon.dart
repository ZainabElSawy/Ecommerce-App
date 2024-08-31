import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonCoupon extends StatelessWidget {
  const CustomButtonCoupon({
    Key? key,
    required this.textbutton,
    this.onPressed,
  }) : super(key: key);
  final String textbutton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        color: AppColor.primarycolor,
        textColor: AppColor.white,
        onPressed: onPressed,
        child: Text(
          textbutton,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
