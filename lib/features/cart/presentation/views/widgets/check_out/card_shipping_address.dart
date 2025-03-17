import 'package:ecommerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardShippingAddress extends StatelessWidget {
  const CardShippingAddress({
    super.key,
    required this.title,
    required this.subTitle,
    required this.isActive,
  });
  final String title;
  final String subTitle;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: isActive ? AppColor.secondarycolor : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
              fontWeight: isActive ? FontWeight.bold : null,
              color: isActive ? AppColor.white : null),
        ),
        subtitle: Text(
          subTitle,
          style: TextStyle(
              fontWeight: isActive ? FontWeight.bold : null,
              color: isActive ? AppColor.white : null),
        ),
      ),
    );
  }
}
