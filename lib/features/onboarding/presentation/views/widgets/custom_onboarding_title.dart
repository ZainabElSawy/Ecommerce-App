import 'package:flutter/material.dart';

import '../../../../../core/constant/color.dart';

class CustomOnBoardingTitle extends StatelessWidget {
  const CustomOnBoardingTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 25,
        color: AppColor.black,
      ),
    );
  }
}