import 'package:ecommerce_app/core/constant/styles.dart';
import 'package:flutter/material.dart';

class CustomAuthTitle extends StatelessWidget {
  const CustomAuthTitle({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Styles.textStyleBold22,
    );
  }
}
