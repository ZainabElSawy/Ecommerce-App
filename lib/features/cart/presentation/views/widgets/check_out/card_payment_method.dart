import 'package:flutter/material.dart';

import '../../../../../../core/constant/color.dart';

class CardPaymentMethod extends StatelessWidget {
  const CardPaymentMethod({
    super.key,
    required this.isActive,
    required this.title,
  });
  final bool isActive;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: isActive ? AppColor.secondarycolor : AppColor.thirdcolor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: TextStyle(
            color: isActive ? AppColor.white : AppColor.secondarycolor,
            height: 1,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
