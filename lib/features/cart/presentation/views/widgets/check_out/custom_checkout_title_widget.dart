import 'package:flutter/material.dart';

import '../../../../../../core/constant/color.dart';

class CustomCheckoutTitle extends StatelessWidget {
  const CustomCheckoutTitle({
    super.key, required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColor.secondarycolor,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }
}
