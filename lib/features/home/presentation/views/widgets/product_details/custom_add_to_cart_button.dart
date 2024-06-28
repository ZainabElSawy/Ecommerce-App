import 'package:flutter/material.dart';

import '../../../../../../core/constant/color.dart';

class CustomAddToCartButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const CustomAddToCartButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      height: 40,
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: AppColor.primarycolor,
        child: Text(
          text,
          style: const TextStyle(
            color: AppColor.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
